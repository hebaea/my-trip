import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/hotel_reservation.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class HotelReservationController extends GetxController {
  static var client = http.Client();
  HotelReservation? hotelReservation;
  var isDataLoading = false.obs;

  // final Set rooms = Set().obs;
  final Set rooms = <dynamic>{}.obs;
  final Set services = <dynamic>{}.obs;

  var selectedRooms = <Rooms>[].obs;
  var selectedServices = <Services>[].obs;

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

  Future reservationShowHotel({required destinationId}) async {
    try {
      isDataLoading(true);

      var response = await client.post(
        Uri.parse("$baseUrl/reservation_show/$destinationId"),
        headers: {
          'Accept': "application/json",
          'Content-Type': 'application/json',
        },
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        hotelReservation = HotelReservation.fromJson(result);
        Get.toNamed(Routes.HOTEL_RESERVATION);
      }
      {
        return null;
      }
    } catch (e) {
      print('error while getting reservationShowHotel $e');
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

  Future<MessageFromBackend?> makeHotelReservation(
      {required destinationId}) async {
    try {
      isDataLoading(true);

      int guestId = storage.read("id");
      String checkInDate =
          DateFormat("yyyy-MM-dd").format(dateRange.value.start);
      String checkOutDate =
          DateFormat("yyyy-MM-dd").format(dateRange.value.end);

      // List<Services>? services;
      // services = [];
      // List<Rooms>? rooms;
      // rooms = [];
      selectedRooms.forEach((element) {
        print("----- selectedRooms price = ${element.roomPrice} ");
        print("----- selectedRooms id  = ${element.roomId} ");
      });
      selectedServices.forEach((element) {
        print("----- selectedServices price = ${element.servicePrice} ");
        print("----- selectedServices id  = ${element.serviceId} ");
      });

      var a = jsonEncode(<String, dynamic>{
        "guest_id": guestId,
        "Checkin_date": checkInDate,
        "Checkout_date": checkOutDate,
        "services": selectedServices,
        "rooms": selectedRooms
      });

      print("---------------- here --- ${a}");
      print("---------------- destinationId --- ${destinationId}");

      var response = await client.post(
        Uri.parse("$baseUrl/reservation_create/$destinationId"),
        headers: {
          'Accept': "application/json",
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "guest_id": guestId,
          "Checkin_date": checkInDate,
          "Checkout_date": checkOutDate,
          "services": selectedServices,
          "rooms": selectedRooms
        }),
        // bodyData,
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
      print('error while makeHotelReservation $e');
    } finally {
      isDataLoading(false);
    }
    return null;
  }
}
