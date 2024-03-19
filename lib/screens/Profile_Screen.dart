import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/AppCubit/cubit.dart';
import 'package:mental_health/screens/Change%20Name.dart';
import 'package:mental_health/screens/login.dart';

import '../AppCubit/states.dart';
import '../widgets/custom_text.dart'; // Import your login page file

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, Home_States>(
      listener: (BuildContext context, Home_States state) {},
      builder: (BuildContext context, Home_States state) {
        final user = LayoutCubit.get(context).usermodel;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: CustomText(
                          text: 'Hi there ${LayoutCubit.get(context).usermodel!.name}!',
                          fontSize: 25,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5, // Add elevation shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      color: const Color(0xFFADD8E6), // Pastel blue color
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'Name:',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${user?.name ?? "Unknown"}',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 5, // Add elevation shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      color: const Color(0xFFADD8E6), // Pastel blue color
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'Email:',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${user?.email ?? "Unknown"}',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNamePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFADD8E6), // Pastel blue color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5, // Add elevation for a fancy look
                      ),
                      child: Text(
                        'Change Name',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        LayoutCubit.get(context).signoutGoogle().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: const Color(0xFFADD8E6)), // Border color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
