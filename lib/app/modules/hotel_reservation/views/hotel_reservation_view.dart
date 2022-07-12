import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import '../../../data/model/hotel_reservation.dart';
import '../controllers/hotel_reservation_controller.dart';

class HotelReservationView extends GetView<HotelReservationController> {
  HotelReservationView({Key? key}) : super(key: key);
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(
          'حجز فندق',
          color: AppThemeColors.primaryPureWhite,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const DefaultText('الغرف المتوفرة :'),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  String roomType = "";
                  try {
                    roomType = controller.hotelReservation!.rooms![i].roomType!;
                  } catch (e) {
                    roomType = "";
                  }
                  int roomPrice = 0;
                  try {
                    roomPrice =
                        controller.hotelReservation!.rooms![i].roomPrice!;
                  } catch (e) {
                    roomPrice = 0;
                  }

                  return Column(
                    children: [
                      Obx(
                        () => CheckboxListTile(
                          title: DefaultText('نوع الغرفة : $roomType'),
                          subtitle: DefaultText('سعر الغرفة : $roomPrice'),
                          activeColor: AppThemeColors.primaryColor,
                          // value: controller.checkBool.value,
                          value: controller.rooms.contains(i),
                          onChanged: (value) {
                            if (value != null && value == true) {
                              controller.rooms.add(i);
                              var rooms = Rooms(
                                  roomId: controller
                                      .hotelReservation!.rooms![i].roomId,
                                  roomType: controller
                                      .hotelReservation!.rooms![i].roomType,
                                  roomPrice: controller
                                      .hotelReservation!.rooms![i].roomPrice);
                              controller.selectedRooms.add(rooms);
                            } else {
                              controller.rooms.remove(i);
                              var rooms = Rooms(
                                  roomId: controller
                                      .hotelReservation!.rooms![i].roomId,
                                  roomType: controller
                                      .hotelReservation!.rooms![i].roomType,
                                  roomPrice: controller
                                      .hotelReservation!.rooms![i].roomPrice);
                              controller.selectedRooms.remove(rooms);
                            }
                            // controller.checkBool.value =
                            //     !controller.checkBool.value;
                            // print(controller.checkBool.value);
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
                itemCount: controller.hotelReservation?.rooms?.length,
              ),
            ),
            const DefaultText('الخدمات المتوفرة :'),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: controller.hotelReservation?.services?.length,
                itemBuilder: (ctx, i) {
                  String serviceName = "";
                  try {
                    serviceName =
                        controller.hotelReservation!.services![i].serviceName!;
                  } catch (e) {
                    serviceName = "";
                  }
                  int servicePrice = 0;
                  try {
                    servicePrice =
                        controller.hotelReservation!.services![i].servicePrice!;
                  } catch (e) {
                    servicePrice = 0;
                  }

                  return Column(
                    children: [
// TODO check if services is null ?
                      Obx(
                        () => CheckboxListTile(
                          title: DefaultText('اسم الخدمة : $serviceName'),
                          subtitle: DefaultText('سعر الخدمة : $servicePrice'),
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
                      controller.makeHotelReservation(
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
//TODO make select services in deffrient screen with new button
