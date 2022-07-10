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
    String checkinDate = "";
    try {
      checkinDate = controller.guestReservationList!.checkinDate!;
      print(checkinDate);
    } catch (e) {
      checkinDate = "";
    }
    String checkoutDate = "";
    try {
      checkoutDate = controller.guestReservationList!.checkoutDate!;
      print(checkoutDate);
    } catch (e) {
      checkoutDate = "";
    }
    int total = 0;
    try {
      total = controller.guestReservationList!.total!;
      print(total);
    } catch (e) {
      total = 0;
    }
    String status = "";
    try {
      status = controller.guestReservationList!.status!;
      print(status);
    } catch (e) {
      status = '';
    }
    return Scaffold(
        body:
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         "assets/images/empty_reservatins.svg",
            //         height: 100.h,
            //         width: 109.w,
            //       ),
            //       SizedBox(
            //         height: 20.h,
            //       ),
            //       DefaultText(
            //         "قائمة الحجوزات فارغة",
            //         fontSize: 16.sp,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       SizedBox(
            //         height: 3.h,
            //       ),
            //       const DefaultText(
            //         " اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا ",
            //         color: AppThemeColors.grayPrimary400,
            //         textAlign: TextAlign.center,
            //       ),
            //     ],
            //   ),
            // ),

            Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        DefaultText('this is check in date $checkinDate'),
        SizedBox(
          height: 20.h,
        ),
        DefaultText('this is check out date $checkoutDate'),
        SizedBox(
          height: 20.h,
        ),
        DefaultText('this is status $status'),
        SizedBox(
          height: 20.h,
        ),
        DefaultText('this is total $total')
      ],
    ));
  }
}
