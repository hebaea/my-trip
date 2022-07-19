import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/apartment_reservation_details/controllers/apartment_reservation_details_controller.dart';
import 'package:my_trip/app/modules/chalet_reservation_details/controllers/chalet_reservation_details_controller.dart';
import 'package:my_trip/app/modules/hotel_reservation_details/controllers/hotel_reservation_details_controller.dart';
import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  ReservationsView({Key? key}) : super(key: key);
  final apartmentReservationDetailsController =
      Get.find<ApartmentReservationDetailsController>();

  final hotelReservationDetailsController =
      Get.find<HotelReservationDetailsController>();
  final chaletReservationDetailsController =
      Get.find<ChaletReservationDetailsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    controller.get();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const DefaultText(
            'حجوزاتي',
            color: AppThemeColors.primaryPureWhite,
          ),
          centerTitle: true,
        ),
        body: controller.guestList.value.isNotEmpty
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
                              total = controller.guestReservationList!
                                  .reservations![i].total!;
                              print(total);
                            } catch (e) {
                              total = 0;
                            }
                            String status = "";
                            try {
                              status = controller.guestReservationList!
                                  .reservations![i].status!;
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
                                        height: 15.h,
                                      ),
                                      DefaultText(
                                          ' الرقم التسلسلي للحجز : ${controller.guestList[i].reservationId}'),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      ListTile(
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DefaultText(
                                                'تاريخ بداية الحجز : ${controller.guestList[i].checkinDate}'),
                                            DefaultText(
                                                ' تاريخ نهاية الحجز : ${controller.guestList[i].checkoutDate}'),
                                          ],
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DefaultText(
                                                ' حالة الحجز : $status'),
                                            DefaultText(' المجموع : $total'),
                                          ],
                                        ),
                                      ),
                                      ButtonBar(
                                        children: [
                                          ElevatedButton(
                                            child: const DefaultText(
                                              'حذف',
                                              color: AppThemeColors
                                                  .primaryPureWhite,
                                            ),
                                            onPressed: () {
                                              controller.makeDeleteReservation(
                                                  controller
                                                      .guestReservationList!
                                                      .reservations![i]
                                                      .reservationId);
                                            },
                                          ),
                                          // ElevatedButton(
                                          //     child: const DefaultText(
                                          //       'تفاصيل',
                                          //       color: AppThemeColors
                                          //           .primaryPureWhite,
                                          //     ),
                                          //     onPressed: () {
                                          //       hotelReservationDetailsController
                                          //           .getHotelReservationDetails(
                                          //               controller
                                          //                   .guestReservationList!
                                          //                   .reservations![i]
                                          //                   .reservationId,
                                          //               i);
                                          //
                                          //       print(
                                          //           "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnmmmmmmmmmmmmmmmmmmmmmmmmm");
                                          //       print(
                                          //           hotelReservationDetailsController
                                          //               .hotelReservationDetails
                                          //               ?.reservationableType);
                                          //
                                          //       var type =
                                          //           hotelReservationDetailsController
                                          //               .hotelReservationDetails
                                          //               ?.reservationableType;
                                          //       print("this is type ");
                                          //       print(type);
                                          //
                                          //       print(controller
                                          //           .guestReservationList!
                                          //           .reservations![i]
                                          //           .reservationId);
                                          //     }),
                                        ],
                                      ),
                                    ])),
                              ],
                            );
                          },
                          itemCount: controller.guestList.length,
                        ),
                ))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        "ستظهر الحجوزات الخاصة بك هنا بعد الحجز ",
                        color: AppThemeColors.grayPrimary400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
