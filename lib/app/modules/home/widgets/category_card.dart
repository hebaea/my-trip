import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;

  const CategoryCard({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => const CountryDetail()));

      //go to specific category destinations

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Container(
          alignment: Alignment.center,
          width: 150.w,
          height: 80.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
              colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.5), BlendMode.darken),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
              alignment: Alignment.center,
              child: DefaultText(
                text,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppThemeColors.primaryPureWhite,
              )),
        ),
      ),
    );
  }
}
