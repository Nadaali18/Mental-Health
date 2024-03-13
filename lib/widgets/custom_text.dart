import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.fontWeight,
      this.text,
      this.fontSize,
      this.color,
      this.fontFamily,
      this.textdirection});
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textdirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: textdirection,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily),
    );
  }
}
