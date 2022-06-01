import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDefaultTextStyle extends TextStyle {
  MyDefaultTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    String? fontFamily,
  }) : super(
          fontSize: fontSize?.sp ?? 14.sp,
          fontFamily: fontFamily ?? 'Cairo',
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          height: height,
        );
}
