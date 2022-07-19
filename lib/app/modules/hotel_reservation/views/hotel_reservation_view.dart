import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                                  roomPrice: controller
                                      .hotelReservation!.rooms![i].roomPrice,
                                  roomType: controller
                                      .hotelReservation!.rooms![i].roomType);
                              controller.selectedRooms.remove(rooms);
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
                itemCount: controller.hotelReservation?.rooms?.length,
              ),
            ),
            RoundedButton(
              press: () async {
                Get.bottomSheet(
                  Container(
                    color: AppThemeColors.primaryPureWhite,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        String serviceName = "";
                        try {
                          serviceName = controller
                              .hotelReservation!.services![i].serviceName!;
                        } catch (e) {
                          serviceName = "";
                        }
                        int servicePrice = 0;
                        try {
                          servicePrice = controller
                              .hotelReservation!.services![i].servicePrice!;
                        } catch (e) {
                          servicePrice = 0;
                        }

                        return Column(
                          children: [
                            SizedBox(height: 5.h),
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
                                        serviceId: controller.hotelReservation!
                                            .services![i].serviceId,
                                        servicePrice: controller
                                            .hotelReservation!
                                            .services![i]
                                            .servicePrice,
                                        serviceName: controller
                                            .hotelReservation!
                                            .services![i]
                                            .serviceName);
                                    controller.selectedServices.add(services);
                                  } else {
                                    controller.services.remove(i);
                                    var services = Services(
                                        serviceId: controller.hotelReservation!
                                            .services![i].serviceId,
                                        servicePrice: controller
                                            .hotelReservation!
                                            .services![i]
                                            .servicePrice,
                                        serviceName: controller
                                            .hotelReservation!
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
                      itemCount: controller.hotelReservation?.services!.length,
                    ),
                  ),
                );
              },
              text: 'اختر الخدمات',
            ),
            // const DefaultText('الخدمات المتوفرة :'),
            // SizedBox(
            //   height: 250,
            //   child: ListView.builder(
            //     itemCount: controller.hotelReservation?.services?.length,
            //     itemBuilder: (ctx, i) {
            //       String serviceName = "";
            //       try {
            //         serviceName =
            //             controller.hotelReservation!.services![i].serviceName!;
            //       } catch (e) {
            //         serviceName = "";
            //       }
            //       int servicePrice = 0;
            //       try {
            //         servicePrice =
            //             controller.hotelReservation!.services![i].servicePrice!;
            //       } catch (e) {
            //         servicePrice = 0;
            //       }
            //
            //       return Column(
            //         children: [
            //           Obx(
            //             () => CheckboxListTile(
            //               title: DefaultText('اسم الخدمة : $serviceName'),
            //               subtitle: DefaultText('سعر الخدمة : $servicePrice'),
            //               activeColor: AppThemeColors.primaryColor,
            //               value: controller.services.contains(i),
            //               onChanged: (value) {
            //                 if (value != null && value == true) {
            //                   controller.services.add(i);
            //                   var services = Services(
            //                       serviceId: controller
            //                           .hotelReservation!.services![i].serviceId,
            //                       servicePrice: controller.hotelReservation!
            //                           .services![i].servicePrice,
            //                       serviceName: controller.hotelReservation!
            //                           .services![i].serviceName);
            //                   controller.selectedServices.add(services);
            //                 } else {
            //                   controller.services.remove(i);
            //                   var services = Services(
            //                       serviceId: controller
            //                           .hotelReservation!.services![i].serviceId,
            //                       servicePrice: controller.hotelReservation!
            //                           .services![i].servicePrice,
            //                       serviceName: controller.hotelReservation!
            //                           .services![i].serviceName);
            //                   controller.selectedServices.remove(services);
            //                 }
            //               },
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 20),
            //             child: Divider(),
            //           ),
            //           // SizedBox(height: 20.h),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 5.h),
            RoundedButton(
              press: () {
                controller.chooseDateRangePicker();
              },
              text: 'إختر تاريخ الحجز',
            ),
            SizedBox(height: 5.h),
            Obx(() => DefaultText(
                  'تاريخ بداية الحجز : ${DateFormat("yyyy-MM-dd").format(controller.dateRange.value.start)}',
                )),
            SizedBox(height: 5.h),
            Obx(() => DefaultText(
                  'تاريخ نهاية الحجز : ${DateFormat("yyyy-MM-dd").format(controller.dateRange.value.end)}',
                )),
            SizedBox(height: 5.h),
            // DefaultText('total :'),
            SizedBox(height: 5.h),

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
//TODO calculate total price
