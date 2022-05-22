import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  const ReservationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/empty_reservatins.svg",
              height: 100.h,
              width: 109.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultText(
              "قائمة الحجوزات فارغة",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 3.h,
            ),
            const DefaultText(
              " اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا ",
              color: AppThemeColors.grayPrimary400,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
