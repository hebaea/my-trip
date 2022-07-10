import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
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
              height: 500,
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
                  return Column(
                    children: [
                      Obx(
                        () => CheckboxListTile(
                          title: DefaultText('موقع الشاليه : $chaletLocation'),
                          subtitle: DefaultText('سعر الشاليه : $chaletPrice'),
                          activeColor: AppThemeColors.primaryColor,
                          value: controller.checkBool.value,
                          onChanged: (value) {
                            controller.checkBool.value =
                                !controller.checkBool.value;
                            print(controller.checkBool.value);
                            //TODO WHY VALUE CHANGE FOR ALL
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
                itemCount: controller.chaletReservation?.chalets!.length,
              ),
            ),
            SizedBox(height: 20.h),
            RoundedButton(
              press: () {
                controller.chooseServices();
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
                  'تاريخ بداية الحجز : ${DateFormat("dd-MM-yyyy").format(controller.dateRange.value.start)}',
                )),
            SizedBox(height: 20.h),
            Obx(() => DefaultText(
                  'تاريخ نهاية الحجز : ${DateFormat("dd-MM-yyyy").format(controller.dateRange.value.end)}',
                )),
            SizedBox(height: 20.h),
            Obx(() => controller.isDataLoading.value
                ? const CircularProgressIndicator()
                : RoundedButton(
                    press: () {
                      controller.makeChaletReservation(
                          destinationId: destinationDetailsController
                              .destinationDetails?.destinationId);
                    },
                    text: 'إتمام عملية الحجز',
                  ))
          ],
        ),
      ),
    );
  }
}
