import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';

import '../controllers/appartment_reservation_controller.dart';

class ApartmentReservationView extends GetView<ApartmentReservationController> {
  const ApartmentReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(
          'حجز شقة',
          color: AppThemeColors.primaryPureWhite,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                String serviceName = "";
                try {
                  serviceName = controller
                      .apartmentReservation!.services![i].serviceName!;
                } catch (e) {
                  serviceName = "";
                }
                int servicePrice = 0;
                try {
                  servicePrice = controller
                      .apartmentReservation!.services![i].servicePrice!;
                } catch (e) {
                  servicePrice = 0;
                }
                return Column(
                  children: [
                    CheckboxListTile(
                      title: DefaultText('اسم الخدمة : $serviceName'),
                      subtitle: DefaultText('سعر الخدمة : $servicePrice'),
                      activeColor: AppThemeColors.primaryColor,
                      value: true,
                      onChanged: (bool? value) {},
                      // trailing: Checkbox(
                      //   activeColor: AppThemeColors.primaryColor,
                      //   onChanged: (value) {},
                      //   value: true,
                      // ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                    // SizedBox(height: 20.h),
                  ],
                );
              },
              itemCount: controller.apartmentReservation!.services!.length,
            ),
          ),
          SizedBox(height: 20.h),
          RoundedButton(
            press: () {
              controller.choooseDateRangePicker();
            },
            text: 'إختر تاريخ الحجز',
          ),
          SizedBox(height: 20.h),
          Obx(() => DefaultText(
                'تاريخ بداية الحجز : ' +
                    DateFormat("dd-MM-yyyy")
                        .format(controller.dateRange.value.start)
                        .toString(),
              )),
          SizedBox(height: 20.h),
          Obx(() => DefaultText(
                'تاريخ نهاية الحجز : ' +
                    DateFormat("dd-MM-yyyy")
                        .format(controller.dateRange.value.end)
                        .toString(),
              )),
          SizedBox(height: 20.h),
          RoundedButton(
            press: () {},
            text: 'إتمام عملية الحجز',
          ),
        ],
      ),
    );
  }
}
