import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/data/model/chalet_reservation.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import '../controllers/chalets_reservation_controller.dart';

class ChaletsReservationView extends GetView<ChaletsReservationController> {
  ChaletsReservationView({Key? key}) : super(key: key);
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(
          'حجز شاليه',
          color: AppThemeColors.primaryPureWhite,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const DefaultText('الشاليهات المتوفرة :'),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  String chaletLocation = "";
                  try {
                    chaletLocation = controller
                        .chaletReservation!.chalets![i].chaletLocation!;
                  } catch (e) {
                    chaletLocation = "";
                  }
                  int chaletPrice = 0;
                  try {
                    chaletPrice =
                        controller.chaletReservation!.chalets![i].chaletPrice!;
                  } catch (e) {
                    chaletPrice = 0;
                  }
                  String numberPeople = "";
                  try {
                    numberPeople = controller
                        .chaletReservation!.chalets![i].numberOfPeople!;
                  } catch (e) {
                    numberPeople = "";
                  }
                  return Column(
                    children: [
                      Obx(
                        () => CheckboxListTile(
                          title: DefaultText(
                              'موقع الشاليه : $chaletLocation  \n عدد الأشخاص $numberPeople'),
                          subtitle: DefaultText('سعر الشاليه : $chaletPrice'),
                          activeColor: AppThemeColors.primaryColor,
                          value: controller.chalets.contains(i),
                          onChanged: (value) {
                            if (value != null && value == true) {
                              controller.chalets.add(i);
                              var chalets = Chalets(
                                  chaletId: controller
                                      .chaletReservation!.chalets![i].chaletId,
                                  chaletLocation: controller.chaletReservation!
                                      .chalets![i].chaletLocation,
                                  chaletPrice: controller.chaletReservation!
                                      .chalets![i].chaletPrice);
                              controller.selectedChalets.add(chalets);
                            } else {
                              controller.chalets.remove(i);
                              var chalets = Chalets(
                                  chaletId: controller
                                      .chaletReservation!.chalets![i].chaletId,
                                  chaletLocation: controller.chaletReservation!
                                      .chalets![i].chaletLocation,
                                  chaletPrice: controller.chaletReservation!
                                      .chalets![i].chaletPrice);
                              controller.selectedChalets.remove(chalets);
                            }
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                    ],
                  );
                },
                itemCount: controller.chaletReservation?.chalets!.length,
              ),
            ),
            SizedBox(height: 20.h),
            RoundedButton(
              press: () async {
                // controller.chooseServices();
                Get.bottomSheet(
                  Container(
                    color: AppThemeColors.primaryPureWhite,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        String serviceName = "";
                        try {
                          serviceName = controller
                              .chaletReservation!.services![i].serviceName!;
                        } catch (e) {
                          serviceName = "";
                        }
                        int servicePrice = 0;
                        try {
                          servicePrice = controller
                              .chaletReservation!.services![i].servicePrice!;
                        } catch (e) {
                          servicePrice = 0;
                        }

                        return Column(
                          children: [
                            SizedBox(height: 20.h),
                            Obx(
                              () => CheckboxListTile(
                                title: DefaultText('اسم الخدمة : $serviceName'),
                                subtitle:
                                    DefaultText('سعر الخدمة : $servicePrice'),
                                activeColor: AppThemeColors.primaryColor,
                                value: controller.services.contains(i),
                                onChanged: (value) {
                                  if (value != null && value == true) {
                                    controller.services.add(i);
                                    var services = Services(
                                        serviceId: controller.chaletReservation!
                                            .services![i].serviceId,
                                        servicePrice: controller
                                            .chaletReservation!
                                            .services![i]
                                            .servicePrice,
                                        serviceName: controller
                                            .chaletReservation!
                                            .services![i]
                                            .serviceName);
                                    controller.selectedServices.add(services);
                                  } else {
                                    controller.services.remove(i);
                                    var services = Services(
                                        serviceId: controller.chaletReservation!
                                            .services![i].serviceId,
                                        servicePrice: controller
                                            .chaletReservation!
                                            .services![i]
                                            .servicePrice,
                                        serviceName: controller
                                            .chaletReservation!
                                            .services![i]
                                            .serviceName);
                                    controller.selectedServices
                                        .remove(services);
                                  }
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(),
                            ),
                            // SizedBox(height: 20.h),
                          ],
                        );
                      },
                      itemCount: controller.chaletReservation?.services!.length,
                    ),
                  ),
                );
              },
              text: 'اختر الخدمات',
            ),
            SizedBox(height: 20.h),
            RoundedButton(
              press: () {
                controller.chooseDateRangePicker();
              },
              text: 'إختر تاريخ الحجز',
            ),
            SizedBox(height: 20.h),
            Obx(() => DefaultText(
                  'تاريخ بداية الحجز : ${DateFormat("yyyy-MM-dd").format(controller.dateRange.value.start)}',
                )),
            SizedBox(height: 20.h),
            Obx(() => DefaultText(
                  'تاريخ نهاية الحجز : ${DateFormat("yyyy-MM-dd").format(controller.dateRange.value.end)}',
                )),
            SizedBox(height: 20.h),
            Obx(() => controller.isDataLoading.value
                ? const CircularProgressIndicator()
                : RoundedButton(
                    press: () {
                      controller.makeChaletReservation(
                        destinationId: destinationDetailsController
                            .destinationDetails?.destinationId,
                      );
                    },
                    text: 'إتمام عملية الحجز',
                  ))
          ],
        ),
      ),
    );
  }
}
