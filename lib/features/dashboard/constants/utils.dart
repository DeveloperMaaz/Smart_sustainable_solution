import 'package:flutter/material.dart';

class ConstColors {
  static const black = Color(0xff1E1E1E);
  static const black2 = Color.fromARGB(255, 125, 124, 124);
  static const black3 = Color.fromARGB(255, 98, 89, 89);
  static const white = Color(0xffFFFFFF);
  static const white2 = Color(0xffD9D9D9);
  static const white3 = Color.fromARGB(255, 152, 147, 147);
  static const none = Color;
  static const green = Color.fromARGB(255, 6, 155, 48);
  static const orange = Color.fromARGB(255, 225, 149, 7);
  static const red = Color.fromARGB(255, 225, 7, 7);
}

class MyTextStyle extends TextStyle {
  static const textStyle1 =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const textStyle1b =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  static const textStyle2 =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  static const textStyle2b =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static const textStyle3 =
  TextStyle(fontSize: 22, fontWeight: FontWeight.w400);
  static const textStyle3b =
  TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

  static const textStyle4 =
  TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
}

class ReUsableTextFField extends StatelessWidget {
  const ReUsableTextFField({
    Key? key,
    this.hintText,
    required this.labelText,
    this.readOnly = false,
    this.validator,
    this.icon,
    this.controller,
  }) : super(key: key);

  final String? hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        hintStyle: const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
      ),
    );
  }
}
