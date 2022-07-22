import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

import '../controllers/hotel_reservation_details_controller.dart';

class HotelReservationDetailsView
    extends GetView<HotelReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: DefaultText(
            'تفاصيل الحجز',
            color: AppThemeColors.primaryPureWhite,
          ),
          centerTitle: true,
        ),
        body: controller.hotelReservationDetails!.room != []
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Obx(
                  () => controller.isDataLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                itemBuilder: (ctx, i) {
                                  int? destinationReservationId = 0;
                                  try {
                                    destinationReservationId = controller
                                        .hotelReservationDetails!
                                        .room![i]
                                        .destinationReservationId;
                                    print(destinationReservationId);
                                  } catch (e) {
                                    destinationReservationId = 0;
                                  }
                                  int reservationId = 0;
                                  try {
                                    reservationId = controller
                                        .hotelReservationDetails!
                                        .room![i]
                                        .reservationId!;
                                    print(reservationId);
                                  } catch (e) {
                                    reservationId = 0;
                                  }
                                  int reservationableId = 0;
                                  try {
                                    reservationableId = controller
                                        .hotelReservationDetails!
                                        .room![i]
                                        .reservationableId!;
                                    print(reservationableId);
                                  } catch (e) {
                                    reservationableId = 0;
                                  }
                                  int chaletPrice = 0;
                                  try {
                                    chaletPrice = controller
                                        .hotelReservationDetails!
                                        .room![i]
                                        .price!;
                                    print(chaletPrice);
                                  } catch (e) {
                                    chaletPrice = 0;
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
                                          ListTile(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DefaultText(
                                                    'destination Reservation Id $destinationReservationId'),
                                                DefaultText(
                                                    'reservation Id $reservationId'),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DefaultText(
                                                    'reservationable Id $reservationableId'),
                                                DefaultText(
                                                    'سعر الغرفة : $chaletPrice'),
                                                SizedBox(
                                                  height: 100,
                                                  child: ListView.builder(
                                                    itemBuilder: (ctx, i) {
                                                      int serviceReservationId =
                                                          0;
                                                      try {
                                                        serviceReservationId =
                                                            controller
                                                                .hotelReservationDetails!
                                                                .service![i]
                                                                .serviceReservationsId!;
                                                        print(
                                                            serviceReservationId);
                                                      } catch (e) {
                                                        serviceReservationId =
                                                            0;
                                                      }
                                                      String serviceId = '';
                                                      try {
                                                        serviceId = controller
                                                            .hotelReservationDetails!
                                                            .service![i]
                                                            .serviceName!;
                                                        print(serviceId);
                                                      } catch (e) {
                                                        serviceId = '';
                                                      }
                                                      int servicePrice = 0;
                                                      try {
                                                        servicePrice = controller
                                                            .hotelReservationDetails!
                                                            .service![i]
                                                            .price!;
                                                        print(servicePrice);
                                                      } catch (e) {
                                                        servicePrice = 0;
                                                      }

                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          DefaultText(
                                                              'إسم الخدمة : $serviceId'),
                                                          DefaultText(
                                                              'سعر الخدمة : $servicePrice'),
                                                        ],
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .hotelReservationDetails
                                                        ?.service
                                                        ?.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: controller
                                    .hotelReservationDetails?.room?.length,
                              ),
                            ),
                          ],
                        ),
                ))
            : const Center(
                child: DefaultText('no details something went wrong')));
  }
}
