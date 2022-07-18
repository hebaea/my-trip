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
  final Set services = <dynamic>{}.obs;

  var selectedServices = <Services>[].obs;

  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;

  // changeVal(value) {
  //   value = !value;
  // }

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
          'Content-Type': 'application/json',
          'Accept': "application/json"

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
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 20),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'إختر تاريخ الحجز',
      saveText: 'حفظ',
    );
    if (pickedDate != null && pickedDate != dateRange.value) {
      dateRange.value = pickedDate;
    }
  }

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

      selectedServices.forEach((element) {
        print("----- selectedServices price = ${element.servicePrice} ");
        print("----- selectedServices id  = ${element.serviceId} ");
      });

      var a = jsonEncode(<String, dynamic>{
        "guest_id": guestId,
        "Checkin_date": checkInDate,
        "Checkout_date": checkOutDate,
        "services": selectedServices,
        "apartment_price": apartmentPrice
      });

      print("---------------- here --- ${a}");
      print("---------------- destinationId --- ${destinationId}");

      print('+++++++++++++++++++++++++++++++++++');
      print(guestId);
      var response = await client.post(
        Uri.parse("$baseUrl/reservation_create/$destinationId"),
        headers: {
          'Accept': "application/json",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "guest_id": guestId,
          "Checkin_date": checkInDate,
          "Checkout_date": checkOutDate,
          "apartment_price": apartmentPrice,
          "services": selectedServices,
        }),
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
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
