import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/data/model/appartment_reservation.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';

import '../controllers/appartment_reservation_controller.dart';

class ApartmentReservationView extends GetView<ApartmentReservationController> {
  ApartmentReservationView({Key? key}) : super(key: key);
  final destinationDetailsController = Get.find<DestinationDetailsController>();

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
                    SizedBox(height: 20.h),

                    DefaultText(
                        'سعر الشقة : ${controller.apartmentReservation?.apartment?.first.apartmentPrice}'),
                    SizedBox(height: 20.h),

                    const DefaultText('الخدمات المتوفرة :'),
                    SizedBox(height: 20.h),

                    Obx(
                      () => CheckboxListTile(
                        title: DefaultText('اسم الخدمة : $serviceName'),
                        subtitle: DefaultText('سعر الخدمة : $servicePrice'),
                        activeColor: AppThemeColors.primaryColor,
                        value: controller.services.contains(i),
                        onChanged: (value) {
                          if (value != null && value == true) {
                            controller.services.add(i);
                            var services = Services(
                                serviceId: controller.apartmentReservation!
                                    .services![i].serviceId,
                                servicePrice: controller.apartmentReservation!
                                    .services![i].servicePrice,
                                serviceName: controller.apartmentReservation!
                                    .services![i].serviceName);
                            controller.selectedServices.add(services);
                          } else {
                            controller.services.remove(i);
                            var services = Services(
                                serviceId: controller.apartmentReservation!
                                    .services![i].serviceId,
                                servicePrice: controller.apartmentReservation!
                                    .services![i].servicePrice,
                                serviceName: controller.apartmentReservation!
                                    .services![i].serviceName);
                            controller.selectedServices.remove(services);
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
              itemCount: controller.apartmentReservation!.services!.length,
            ),
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
                    String checkInDate = DateFormat("yyyy-MM-dd")
                        .format(controller.dateRange.value.start);
                    String checkOutDate = DateFormat("yyyy-MM-dd")
                        .format(controller.dateRange.value.end);

                    final storage = GetStorage();

                    int guestId = storage.read("id");

                    print(
                        "--------------- Here Pressed ----------------------");
                    print(guestId);
                    controller.makeApartmentReservation(
                        destinationId: destinationDetailsController
                            .destinationDetails?.destinationId,
                        guestId: guestId,
                        checkInDate: checkInDate,
                        apartmentPrice: controller.apartmentReservation
                            ?.apartment?.first.apartmentPrice
                            ?.toDouble(),
                        checkOutDate: checkOutDate);
                  },
                  text: 'إتمام عملية الحجز',
                ))
        ],
      ),
    );
  }
}
