import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

class AdsItem extends StatelessWidget {
  final String? link;

  // final String? place;
  // final String? location;
   final BuildContext? context;

  const AdsItem({
    Key? key,
    this.link,
    // this.place,
     this.context,
    // this.location
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SizedBox(
          width: 350.w,
          height: 130.h,
          child: Stack(
            children: [
              Container(
                width: 350.w,
                height: 130.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: AssetImage((link!)), fit: BoxFit.cover)),
              ),
              Container(
                width: 350.w,
                height: 130.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0),
                        ],
                        end: Alignment.centerRight,
                        begin: Alignment.centerLeft)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, bottom: 5.h),
                        // child: DefaultText(
                        //   place!,
                        //   height: 1,
                        //   color: AppThemeColors.primaryPureWhite,
                        //   fontSize: 24.sp,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, bottom: 20.h),
                        // child: DefaultText(
                        //   location!,
                        //   height: 1,
                        //   color: AppThemeColors.primaryPureWhite,
                        //   fontSize: 16,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
