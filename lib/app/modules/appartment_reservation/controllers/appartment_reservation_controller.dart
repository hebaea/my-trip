import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/appartment_reservation.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ApartmentReservationController extends GetxController {
  static var client = http.Client();
  ApartmentReservation? apartmentReservation;
  var isDataLoading = false.obs;
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future reservationShowApartment({required destinationId}) async {
    try {
      isDataLoading(true);

      var response = await client.post(
        Uri.parse("$baseUrl/reservation_show/$destinationId"),
        headers: {
          'Accept': "application/json",
          // 'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        apartmentReservation = ApartmentReservation.fromJson(result);
        Get.toNamed(Routes.APARTMENT_RESERVATION);
      }
      {
        return null;
      }
    } catch (e) {
      print('error while getting reservationShowApartment $e');
    } finally {
      isDataLoading(false);
    }
  }

  choooseDateRangePicker() async {
    DateTimeRange? pickedDate = await showDateRangePicker(
      context: Get.context!,
      initialDateRange: dateRange.value,
      // DateTimeRange(
      // start: DateTime.now(),
      // end: DateTime(2024, 11, 24),

      // ),
      firstDate:
          // DateTime(
          DateTime.now(),
      // .year - 20
      // ),
      lastDate: DateTime(DateTime.now().year + 20),
      // initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'إختر تاريخ الحجز',
      // cancelText: 'إلغاء',
      // confirmText: 'تأكيد',
      saveText: 'حفظ',
      // errorFormatText: 'أدخل صيغة تاريخ صحيحة',
      // errorInvalidText: 'أدخل صيغة تاريخ صحيحة ضمن نطاق التاريخ المسموح به',
      // fieldLabelText: 'تاريخ الحجز',
      // fieldHintText: 'السنة/اليوم/الشهر',
      // selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != dateRange.value) {
      dateRange.value = pickedDate;
    }
  }

// bool disableDate(DateTime day) {
//   if ((day.isAfter(DateTime.now()
//           .subtract(const Duration(days: 1))) // can select from today and on
//       // &&
//       // day.isBefore(DateTime.now().add(Duration(days: 5)))
//       )) {
//     return true;
//   }
//   return false;
// }
}
