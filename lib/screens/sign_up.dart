import 'package:flutter/material.dart';
import 'package:mental_health/screens/login.dart';
import 'package:mental_health/widgets/custom_text.dart';
import 'package:mental_health/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00677f),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: CustomText(
              text: 'Welcome!',
              fontSize: 45,
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Center(
                    child: CustomText(
                      text: 'Sign Up',
                      textdirection: TextAlign.center,
                      color: Color(0xFF00677f),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CustomText(
                      text: 'Full Name',
                      textdirection: TextAlign.start,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomTextField(
                    text: 'User Name',
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
                  CustomTextField(
                      text: 'Password',
                      obscureText: isPassVisible,
                      icon: isPassVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onPressed: () {
                        isPassVisible = !isPassVisible;
                        setState(() {});
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00677f),
                          minimumSize: const Size(335, 45)),
                      child: const CustomText(
                        text: 'Sign Up',
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
                        onTap: () {},
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
                        text: 'already have an account?',
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const CustomText(
                            text: 'Login',
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
