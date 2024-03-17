import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final bool needUnderline;
  final TextDirection? textDirection;

  const CustomText(
    this.text, {
    Key? key,
    this.fontSize = 14,
    this.fontFamily = 'cairo',
    this.fontWeight,
    this.color,
    this.textAlign,
    this.needUnderline = false,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 380;
    final adjustedFontSize = fontSize * scaleFactor;

    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        fontSize: adjustedFontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
        decorationColor: color,
        decoration: needUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}
