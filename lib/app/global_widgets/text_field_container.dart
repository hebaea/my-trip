import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8.w,
      decoration: BoxDecoration(
        color: color
        // AppThemeColors.primaryLightColor
        ,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
