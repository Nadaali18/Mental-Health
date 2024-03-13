import 'package:flutter/material.dart';
import 'package:mental_health/widgets/custom_text.dart';
import 'package:mental_health/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF00677f),
      body: Expanded(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.23,
              color: const Color(0xFF00677f),
              child: const Center(
                child: CustomText(
                  text: 'Welcome!',
                  fontSize: 45,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomText(
                      text: 'Login',
                      textdirection: TextAlign.center,
                      color: Color(0xFF00677f),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CustomText(
                      text: 'Email',
                      textdirection: TextAlign.start,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomTextField(
                    text: 'Email@Mail.com',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CustomText(
                      text: 'Password',
                      textdirection: TextAlign.start,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomTextField(
                    text: 'Password',
                  ),
                  Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00677f),
                    minimumSize: const Size(335, 45)),
                child: const CustomText(
                  text: 'Login',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CustomText(
                  text: 'Or Sign Up With',
                  textdirection: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: const Icon(
                      Icons.apple,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Dont have an account?',
                ),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: 'Sign Up',
                      color: Colors.black,
                    )),
              ],
            ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
