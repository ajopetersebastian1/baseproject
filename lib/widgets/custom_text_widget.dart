import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontWeight;
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.textcolor = ktextColor,
      this.fontsize = 12,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: textcolor,
      ),
    );
  }
}
