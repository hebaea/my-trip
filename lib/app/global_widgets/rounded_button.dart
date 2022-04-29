import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: size.width * 0.8.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29.r),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: DefaultText(
        text,
        color: textColor,
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          textStyle: TextStyle(
              color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
    );
  }
}
