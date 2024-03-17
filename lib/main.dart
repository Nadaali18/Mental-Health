import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/VideoCubit.dart';
import 'package:mental_health/screens/Profile_Screen.dart';
import 'package:mental_health/screens/VideosScreen.dart';
import 'package:mental_health/screens/home.dart';
import 'package:mental_health/screens/login.dart';
import 'package:mental_health/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'CacheHelper.dart';
import 'firebase_options.dart';
import 'AppCubit/cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()..GetUserData(),),
        BlocProvider(create: (context) => VideoCubit()..fetchVideoInfo(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CacheHelper.GetData(key: 'uID') == null ? Login() : Home(),
      ),
    );
  }
}
