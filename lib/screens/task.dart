import 'package:flutter/material.dart';
import 'package:mental_health/AppCubit/cubit.dart';
import 'package:mental_health/screens/test.dart';
import 'package:mental_health/widgets/custom_text.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(text:'Welcome, ${LayoutCubit.get(context).usermodel!.name} ^_^',fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Pacifico',),
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                color: const Color(0xFFfbf6f1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
               child: Column(
                 children: [
                ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/task.jpg',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                   const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'Sat, Mar 16',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'Lets Go To Improve Your Mental Health!',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   IconButton(
                        color: const Color.fromARGB(255, 46, 157, 194),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Test()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ))
              ],
               ),
              ),
            ),
            )
        ],
      ),
    );
  }
}
