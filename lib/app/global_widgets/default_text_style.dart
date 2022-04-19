import 'package:flutter/material.dart';

class MyDefaultTextStyle extends TextStyle {
  const MyDefaultTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      double? height,
      String? fontFamily})
      : super(
          fontSize: fontSize ?? 14,
          fontFamily: fontFamily ?? 'Cairo',
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          height: height,
        );
}
