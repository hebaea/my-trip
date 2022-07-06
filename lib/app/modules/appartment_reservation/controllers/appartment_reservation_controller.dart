import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/appartment_reservation.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ApartmentReservationController extends GetxController {
  static var client = http.Client();
  ApartmentReservation? apartmentReservation;
  var isDataLoading = false.obs;
  var checkBool = false.obs;
  final storage = GetStorage();
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;

  changeVal(value) {
    value = !value;
  }

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
          'Content-Type': 'application/json'

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

  chooseDateRangePicker() async {
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
  Future<MessageFromBackend?> makeApartmentReservation(
      {required destinationId,
      required guestId,
      required checkInDate,
      required checkOutDate,
      required apartmentPrice,
      services}) async {
    try {
      isDataLoading(true);
      print("================== d  = ${destinationId} ================");

      // int de = destinationId as int;
      // int guestId = storage.read("id");
      // String checkInDate =
      //     DateFormat("dd-MM-yyyy").format(dateRange.value.start);
      // String checkOutDate =
      //     DateFormat("dd-MM-yyyy").format(dateRange.value.end);
      //
      // double? apartmentPrice =
      //     apartmentReservation?.apartment?.first.apartmentPrice?.toDouble();
      // int apartmentId =
      //     apartmentReservation?.apartment?.first.apartmentId as int;
      List<Services>? services;
      services = [];
      //TODO SELECTED SERVICE ID AND SELECTED SERVICE PRICE
      // var bodyData = <String, dynamic>{};
      // bodyData['guest_id'] = '${guestId}';
      // bodyData['Checkin_date'] = '${checkInDate}';
      // bodyData['Checkout_date'] = '${checkOutDate}';
      // bodyData['apartment_price'] = '${apartmentPrice}';
      // bodyData['apartment_id'] = '${apartmentId}';
      // bodyData['services'] = 'services';
      print('+++++++++++++++++++++++++++++++++++');
      print(guestId);
      // print(bodyData);
      var response = await client.post(
        Uri.parse("$baseUrl/reservation_create/$destinationId"),
        headers: {
          'Accept': "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "guest_id": guestId,
          "Checkin_date": checkInDate,
          "Checkout_date": checkOutDate,
          "apartment_price": apartmentPrice,
          // "apartment_id": apartmentId,
          "services": services,
        }),

        // bodyData
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // customSnackbar("الحجز", result, "success");
        // apartmentReservation = ApartmentReservation.fromJson(result);
        // Get.toNamed(Routes.APARTMENT_RESERVATION);
        MessageFromBackend? messageFromBackend;
        var result = jsonDecode(response.body);
        messageFromBackend = MessageFromBackend.fromJson(result);
        return customSnackbar("الحجز", messageFromBackend.message, "success");
      }
    } catch (e) {
      print('error while makeApartmentReservation $e');
    } finally {
      isDataLoading(false);
    }
  }
}
