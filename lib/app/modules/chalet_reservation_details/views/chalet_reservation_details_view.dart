import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import '../controllers/chalet_reservation_details_controller.dart';

class ChaletReservationDetailsView
    extends GetView<ChaletReservationDetailsController> {
  const ChaletReservationDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const DefaultText(
            'تفاصيل الحجز',
            color: AppThemeColors.primaryPureWhite,
          ),
          centerTitle: true,
        ),
        body: controller.chaletReservationDetails!.chalet != []
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
                                        .chaletReservationDetails!
                                        .chalet![i]
                                        .destinationReservationId;
                                    print(destinationReservationId);
                                  } catch (e) {
                                    destinationReservationId = 0;
                                  }
                                  int reservationId = 0;
                                  try {
                                    reservationId = controller
                                        .chaletReservationDetails!
                                        .chalet![i]
                                        .reservationId!;
                                    print(reservationId);
                                  } catch (e) {
                                    reservationId = 0;
                                  }
                                  int reservationableId = 0;
                                  try {
                                    reservationableId = controller
                                        .chaletReservationDetails!
                                        .chalet![i]
                                        .reservationableId!;
                                    print(reservationableId);
                                  } catch (e) {
                                    reservationableId = 0;
                                  }
                                  int chaletPrice = 0;
                                  try {
                                    chaletPrice = controller
                                        .chaletReservationDetails!
                                        .chalet![i]
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
                                                    'chalet Price $chaletPrice'),
                                                SizedBox(
                                                  height: 100,
                                                  child: ListView.builder(
                                                    itemBuilder: (ctx, i) {
                                                      int serviceReservationId =
                                                          0;
                                                      try {
                                                        serviceReservationId =
                                                            controller
                                                                .chaletReservationDetails!
                                                                .service![i]
                                                                .serviceReservationsId!;
                                                        print(
                                                            serviceReservationId);
                                                      } catch (e) {
                                                        serviceReservationId =
                                                            0;
                                                      }
                                                      int serviceId = 0;
                                                      try {
                                                        serviceId = controller
                                                            .chaletReservationDetails!
                                                            .service![i]
                                                            .serviceId!;
                                                        print(serviceId);
                                                      } catch (e) {
                                                        serviceId = 0;
                                                      }
                                                      int servicePrice = 0;
                                                      try {
                                                        servicePrice = controller
                                                            .chaletReservationDetails!
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
                                                              'service Id $serviceId'),
                                                          DefaultText(
                                                              'service Price $servicePrice'),
                                                        ],
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .chaletReservationDetails
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
                                    .chaletReservationDetails?.chalet?.length,
                              ),
                            ),
                          ],
                        ),
                ))
            : const Center(
                child: DefaultText('no details something went wrong')));
  }
}
