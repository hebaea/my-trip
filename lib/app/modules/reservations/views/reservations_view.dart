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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: controller.guestReservationList?.reservations != []
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Obx(
                () => controller.isDataLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, i) {
                          String checkinDate = "";
                          try {
                            checkinDate = controller.guestReservationList!
                                .reservations![i].checkinDate!;
                            print(checkinDate);
                          } catch (e) {
                            checkinDate = "";
                          }
                          String checkoutDate = "";
                          try {
                            checkoutDate = controller.guestReservationList!
                                .reservations![i].checkoutDate!;
                            print(checkoutDate);
                          } catch (e) {
                            checkoutDate = "";
                          }
                          int total = 0;
                          try {
                            total = controller
                                .guestReservationList!.reservations![i].total!;
                            print(total);
                          } catch (e) {
                            total = 0;
                          }
                          String status = "";
                          try {
                            status = controller
                                .guestReservationList!.reservations![i].status!;
                            print(status);
                          } catch (e) {
                            status = '';
                          }

                          return Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Card(
                                  color: AppThemeColors.primaryLightColor,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    // DefaultText(
                                    //     'تاريخ بداية الحجز : $checkinDate'),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    // DefaultText(
                                    //     ' تاريخ نهاية الحجز : $checkoutDate'),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    // DefaultText(' حالة الحجز : $status'),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    // DefaultText(' المجموع : $total'),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    ListTile(
                                      // leading:

                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(
                                              'تاريخ بداية الحجز : $checkinDate'),
                                          DefaultText(
                                              ' تاريخ نهاية الحجز : $checkoutDate'),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(' حالة الحجز : $status'),
                                          DefaultText(' المجموع : $total'),
                                        ],
                                      ),
                                      // trailing:
                                      // InkWell(
                                      //   child: const Icon(
                                      //     PhosphorIcons.trash,
                                      //     color: AppThemeColors.error500,
                                      //     size: 30,
                                      //   ),
                                      //   onTap: () {
                                      //
                                      //   },
                                      // ),
                                    ),
                                    ButtonBar(
                                      children: [
                                        ElevatedButton(
                                          child: const DefaultText(
                                            'حذف',
                                            color:
                                                AppThemeColors.primaryPureWhite,
                                          ),
                                          onPressed: () {
                                            controller.makeDeleteReservation(
                                                controller
                                                    .guestReservationList!
                                                    .reservations![i]
                                                    .reservationId);
                                          },
                                        ),
                                        ElevatedButton(
                                          child: const DefaultText(
                                            'تفاصيل',
                                            color:
                                                AppThemeColors.primaryPureWhite,
                                          ),
                                          onPressed: () {
                                            controller.getDetails();
                                          },
                                        ),
                                      ],
                                    ),
                                  ])),
                            ],
                          );
                        },
                        itemCount: controller
                            .guestReservationList?.reservations?.length,
                      ),
              ))
          : Padding(
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
