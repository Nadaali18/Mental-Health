import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.text,
      this.icon,
      this.onPressed,
      this.controller,
      this.obscureText = false});
  final String? text;
  final IconData? icon;
  final Function()? onPressed;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:15,right: 15,top: 10,bottom: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: icon != null
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(icon),
                )
              : null,
          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: '$text',
        ),
      ),
    );
  }
}
