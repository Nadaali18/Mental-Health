import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/AppCubit/cubit.dart';

import '../AppCubit/states.dart';

class ChangeNamePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Name',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00677f), // Dark pastel color
        elevation: 0,
      ),
      body: BlocConsumer<LayoutCubit, Home_States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: controller,// Text color white
                    decoration: InputDecoration(
                      hintText: 'Enter new name',
                      hintStyle: TextStyle(color: Colors.white54), // Hint color light gray
                      filled: true,
                      fillColor: const Color(0xFFADD8E6), // Dark pastel color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none, // No border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none, // No border when focused
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        // Call the updateUserName method from LayoutCubit
                        LayoutCubit.get(context).updateUserName(controller.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFADD8E6), // Pastel blue color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Circular borders
                      ),
                      elevation: 5, // Add elevation for a fancy look
                      shadowColor: Colors.grey, // Shadow color
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
