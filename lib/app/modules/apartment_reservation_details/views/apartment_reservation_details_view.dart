import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

import '../controllers/apartment_reservation_details_controller.dart';

class ApartmentReservationDetailsView
    extends GetView<ApartmentReservationDetailsController> {
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
        body: controller.apartmentReservationDetails!.apartment != []
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
                                        .apartmentReservationDetails!
                                        .apartment!
                                        .apartmentId;
                                    print(destinationReservationId);
                                  } catch (e) {
                                    destinationReservationId = 0;
                                  }
                                  int? reservationId = 0;
                                  try {
                                    reservationId = controller
                                        .apartmentReservationDetails!
                                        .apartment!
                                        .apartmentPrice;
                                    print(reservationId);
                                  } catch (e) {
                                    reservationId = 0;
                                  }
                                  String ownerName = '';
                                  try {
                                    ownerName = controller
                                        .apartmentReservationDetails!
                                        .apartment!
                                        .ownerName!;
                                    print(ownerName);
                                  } catch (e) {
                                    ownerName = '';
                                  }
                                  int? apartmentStauts = 0;
                                  try {
                                    apartmentStauts = controller
                                        .apartmentReservationDetails!
                                        .apartment!
                                        .apartmentStauts;
                                    print(apartmentStauts);
                                  } catch (e) {
                                    apartmentStauts = 0;
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
                                                    'الرقم التسلسلي للشقة : $destinationReservationId'),
                                                DefaultText(
                                                    'سعر الشقة : $reservationId'),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DefaultText(
                                                    'حالة الشقة : $apartmentStauts'),
                                                DefaultText(
                                                    'إسم المالك : $ownerName'),
                                                SizedBox(
                                                  height: 100,
                                                  child: ListView.builder(
                                                    itemBuilder: (ctx, i) {
                                                      int serviceReservationId =
                                                          0;
                                                      try {
                                                        serviceReservationId =
                                                            controller
                                                                .apartmentReservationDetails!
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
                                                            .apartmentReservationDetails!
                                                            .service![i]
                                                            .serviceName!;
                                                        print(serviceId);
                                                      } catch (e) {
                                                        serviceId = '';
                                                      }
                                                      int servicePrice = 0;
                                                      try {
                                                        servicePrice = controller
                                                            .apartmentReservationDetails!
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
                                                        .apartmentReservationDetails
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
                              ),
                            ),
                          ],
                        ),
                ))
            : const Center(
                child: DefaultText('no details something went wrong')));
  }
}
