import 'package:flutter/material.dart';
import 'package:mental_health/widgets/custom_text.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({this.text, this.text1}) : super();
  final String? text;
  final String? text1;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 300,
        width: 350,
        child: Center(
          child: Card(
            elevation: 25,
            shadowColor: Colors.black54,
            color: const Color(0xFFADD8E6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: '${widget.text}',
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF006D6D),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: '${widget.text1}',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
