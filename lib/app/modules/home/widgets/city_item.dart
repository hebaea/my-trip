import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

class CityItem extends StatelessWidget {
  final BuildContext? context;
  final String? link;
  final String? place;
  final Function()? onTap;

  const CityItem(
      {Key? key, this.context, this.place, this.link, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SizedBox(
          width: 150.w,
          height: 210.h,
          child: Stack(
            children: [
              Container(
                width: 150.w,
                height: 210.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://mytrip.justhost.ly/$link',
                        ),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 150.w,
                height: 210.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, bottom: 5.h),
                      child: DefaultText(
                        place!,
                        height: 1,
                        color: AppThemeColors.primaryPureWhite,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, bottom: 20.h),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
