import 'package:flutter/material.dart';
import 'package:mental_health/widgets/custom_card.dart';
import 'package:mental_health/widgets/custom_text.dart';


class Relaxed extends StatefulWidget {
  const Relaxed({super.key});

  @override
  State<Relaxed> createState() => _RelaxedState();
}

class _RelaxedState extends State<Relaxed> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            SizedBox(
              height: 100,
              child: Padding(
                padding:  EdgeInsets.all(10),
                child: CustomText(
                  text: 'Daily Motivate',
                  fontSize: 25,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                ),
               ),), 
              SizedBox(
                width:double.infinity ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     CustomCard(
                       text: 'To succeed in life, you need two things: Ignorance and Confidence',
                       text1: 'لكي تنجح في الحياة، أنت تحتاج لشيئين: التجاهل والثقة ',
                     ),
                CustomCard(
                  text: 'Always keep your eyes open. Keep watching. Because whatever you see can inspire you',
                  text1: 'أبقِ عينيك مفتوحتين دائمًا وراقب، لأن كل ما تراه حولك يمكن أن يلهمك  ',
                ),
                CustomCard(
                  text: 'It wasn`t raining when Noah built the ark',
                  text1: 'لم تكن تمطر عندما بنى نوح السفينة',
                ),
                CustomCard(
                  text: 'Genius is 1% inspiration, 99% perspiration',
                  text1: 'العبقرية هي واحد بالمائة إلهام وتسعة وتسعون بالمائة جهد وعرق ',
                ),
                CustomCard(
                  text: 'A comfort zone is a beautiful place, but nothing ever grows there',
                  text1: 'قد تكون الراحة مكان جميل ، ولكن لا شيء ينمو هناك ',
                ),
                CustomCard(
                  text: 'Sometimes you win, sometimes you learn',
                  text1: 'أحياناً تربح وأحياناً تتعلم',
                ),
                CustomCard(
                  text: 'Climb mountains not so the world can see you, but so you can see the world',
                  text1: 'تسلق الجبل ليس لكي يراك العالم, بل لترى أنت العالم',
                ),
                CustomCard(
                  text: 'The most dangerous risk of is the risk of spending your life not doing what you want on the bet you can buy yourself the freedom to do it later',
                  text1: 'أكثر المجازفات خطورة هي قضاء حياتك في عدم فعل ما تريد مراهنا على أن لك الحرية في فعله لاحقا',
                ),
                CustomCard(
                  text: 'Instead of giving myself reasons why I can`t, I give myself reasons why I can',
                  text1: 'بدلا من إعطاء نفسي الاسباب التي تجعلني لا أستطيع, أعطيها الأسباب التي تجعلني استطيع  ',
                ),
                CustomCard(
                  text: 'Challenges are what make life interesting and overcoming them is what make life meaningful',
                  text1: 'التحديات ما تجعل الحياة مثيرة والتغلب عليها هو ما يجعل الحياة ذات معني' ,
                ),
                CustomCard(
                  text: 'The world makes a way for the man who knows where he is going',
                  text1: 'العالم يفسح الطريق للمرء الذي يعرف إلى أين يذهب ',
                ),
                CustomCard(
                  text: 'To succeed in life, you need two things: Ignorance and Confidence',
                  text1: 'لكي تنجح في الحياة، أنت تحتاج لشيئين: التجاهل والثقة ',
                ),
                CustomCard(
                  text: 'I am thankful for all of those who said NO to me. It is because of them I am doing it myself',
                  text1: ' ممتن لكل أولئك الذين قالوا لي “لا”. بسببهم أنا الآن أفعل ذلك بنفسي ',
                ),
                 CustomCard(
                  text: 'If it scares you, it might be a good thing to try',
                  text1: ' إذا كان الأمر يخيفك ، قد يكون من المفيد تجربته  ',
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