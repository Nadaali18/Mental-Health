import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_elevated_button.dart';
import 'package:flutter_application_1/custom_text.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(text: 'Lets Chek Our Mental Health',fontFamily: 'Pacifico',color: Colors.black,),
        
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
            CustomElevatedButton(
              text1: ' الاكتئاب',
             text2:'التعلق'
            ),
             CustomElevatedButton(
                text1: 'انعدام الثقه',
                text2: 'الوسواس القهري',
             ),
              CustomElevatedButton(
                text1: 'اضطرابات النوم',
                text2: 'التفكير المفرط',
              ),
              CustomElevatedButton(
                text1: 'اضطراب الشخصيه',
                text2: 'فرط الحركه وقله الانتباه',
              ),
               CustomElevatedButton(
                text1: 'اضطراب ثنائي القطب',
                text2: 'الرهاب الاجتماعي',
               ),
            ],
          ),
        ),
    );
  }
}