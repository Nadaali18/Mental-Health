
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mental_health/AppCubit/states.dart';
import 'package:mental_health/screens/Profile_Screen.dart';
import 'package:mental_health/screens/VideosScreen.dart';
import 'package:youtube_data_api/models/video_data.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import '../CacheHelper.dart';
import '../CreateUserModelFirestore.dart';
import '../screens/home.dart';
import '../widgets/CustomToast.dart';

class LayoutCubit extends Cubit<Home_States>{

  LayoutCubit() : super(Initial_State());

  static LayoutCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  CreateUserModelFirestore? usermodel = CreateUserModelFirestore();
  GoogleSignInAccount? newUser;

  GoogleSignIn googleSignIn = GoogleSignIn();


  Future<void> signUpWithEmailAndPassword(String email, String password,String name,dynamic context) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        UserCreate(name: name, email: email,uID: value.user!.uid);
        CacheHelper.PutData(key: 'uID', value: value.user!.uid);
        CacheHelper.PutData(key: 'google', value: false);
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
      showToast(message: 'Signed in successfully!');
      emit(UpdateSignInStatus());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
      emit(UpdateSignInStatus());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password,dynamic context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value1) {
        GetUserData().then((value2){
          CacheHelper.PutData(key: 'uID', value: value1.user!.uid);
          CacheHelper.PutData(key: 'google', value: false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
          showToast(message: 'Signed in successfully!');
        });
      });
      emit(UpdateSignInStatus());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
      emit(UpdateSignInStatus());
    }
  }

  Future<void> UserCreate({
    required String? name,
    required String? email,
    required String? uID,
  }) async {
    CreateUserModelFirestore model = CreateUserModelFirestore(
      uID: uID,
      name: name,
      email: email,
    );
    Map<String, dynamic> data = model.ToMap() ?? {}; // Provide a default empty map if ToMap() returns null
    FirebaseFirestore.instance.collection('users').doc(uID).set(
      data,
    ).then((value) {
      emit(CreateUserWithDataInFireBaseSuccess());
      GetUserData();
    }).catchError((onError) {
      print(onError.toString());
      emit(CreateUserWithDataInFireBaseError());
    });
  }

  Future<dynamic> signUpGoogle({context})async{

    final googleuser = await googleSignIn.signIn();

    if (googleuser == null) return;
    newUser = googleuser;

    final googleauth = await googleuser.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleauth.accessToken,
      idToken:  googleauth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(cred).then((value) async{
      CacheHelper.PutData(key: 'uID', value: value.user!.uid);
      CacheHelper.PutData(key: 'google', value: true);
      await FirebaseFirestore.instance.collection('users').doc(value.user!.uid).get().then((value2) {
        if(value2.exists == false){
          UserCreate(
            uID: value.user!.uid,
            name: newUser!.displayName,
            email: newUser!.email,
          );
        }else{
          return null;
        }
      }).catchError((onError){
        showToast(message: 'Something Wrong has happened');
      });
      GetUserData().then((value)
      {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
        showToast(message: 'Signed up successfully!');
      });
    }).catchError((onError){
      print(onError.toString());
      showToast(message: 'Something Wrong has happened');
      signoutGoogle();
    });
    emit(UpdateSignInStatus());
  }

  Future<dynamic> signoutGoogle() async {
    if(CacheHelper.GetData(key: 'google') == true){
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.signOut();
    usermodel = null;
    CacheHelper.sharedPreferences?.remove('uID');
    CacheHelper.sharedPreferences?.remove('google');
    emit(UpdateSignInStatus());
  }

  Future<void> updateUserName(String newName) async {
    try {
      final userId = CacheHelper.GetData(key: 'uID');
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'name': newName,
      });
      // Update local user model
      usermodel?.name = newName;
      showToast(message: 'Name updated successfully!');
      emit(UpdateUserNameSuccess());
    } catch (e) {
      print(e.toString());
      showToast(message: 'Failed to update name. Please try again.');
      emit(UpdateUserNameError());
    }
  }


  Future<dynamic> signoutNormal() async {
    FirebaseAuth.instance.signOut();
    usermodel = null;
    CacheHelper.sharedPreferences?.remove('uID');
    emit(UpdateSignInStatus());
  }


  Future<dynamic> GetUserData(){
    emit(GetUserLoading());
    return FirebaseFirestore.instance.collection('users').doc(CacheHelper.GetData(key: 'uID')).get().then((value) {
      usermodel = CreateUserModelFirestore.fromJson(value.data());
      emit(GetUserSuccsess());
    }).catchError((dynamic error){
      usermodel = null;
      print(error.toString());
      emit(GetUserError());
    });
  }

  Future<void> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
      CacheHelper.PutData(key: 'uID', value: value.user!.uid);
      emit(UpdateSignInStatus());
    }).catchError((onError){
      print(onError.toString());
      showToast(message: 'Something Wrong has happened');
    });
  }

  Future<void> signOutFacebook() async{

  }
}