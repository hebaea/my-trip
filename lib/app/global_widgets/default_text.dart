import 'package:flutter/material.dart';
import 'package:my_trip/app/global_widgets/default_text_style.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.height,
  }) : super(key: key);
  final String text;
  final String? fontFamily;
  final Color? color;
  final double? fontSize, height;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          MyDefaultTextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: color,
            height: height,
          ),
      textAlign: textAlign,
    );
  }
}
