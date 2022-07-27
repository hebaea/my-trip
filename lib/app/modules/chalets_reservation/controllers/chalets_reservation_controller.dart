import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/chalet_reservation.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ChaletsReservationController extends GetxController {
  static var client = http.Client();
  ChaletReservation? chaletReservation;
  var isDataLoading = false.obs;
  var checkBool = false.obs;
  final storage = GetStorage();
  final Set chalets = <dynamic>{}.obs;
  final Set services = <dynamic>{}.obs;

  var selectedChalets = <Chalets>[].obs;
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

  Future reservationShowChalet({required destinationId}) async {
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse("$baseUrl/reservation_show/$destinationId"),
        headers: <String, String>{
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
        chaletReservation = ChaletReservation.fromJson(result);
        Get.toNamed(Routes.CHALETS_RESERVATION);
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

  Future<MessageFromBackend?> makeChaletReservation(
      {required int? destinationId}) async {
    try {
      isDataLoading(true);

      int guestId = storage.read("id");
      String checkInDate =
          DateFormat("yyyy-MM-dd").format(dateRange.value.start);
      String checkOutDate =
          DateFormat("yyyy-MM-dd").format(dateRange.value.end);
      selectedChalets.forEach((element) {
        print("----- selectedRooms price = ${element.chaletPrice} ");
        print("----- selectedRooms id  = ${element.chaletId} ");
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
        "rooms": selectedChalets
      });

      print("---------------- here --- ${a}");
      print("---------------- destinationId --- ${destinationId}");

      final response = await http.post(
        Uri.parse("$baseUrl/reservation_create/$destinationId"),
        headers: <String, String>{
          'Accept': "application/json",
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "guest_id": guestId,
          "Checkin_date": checkInDate,
          "Checkout_date": checkOutDate,
          "services": selectedServices,
          "chalets": selectedChalets
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
      } else {
        throw Exception('Failed to create customSnackbar.');
      }
    } catch (e) {
      print('error while makeChaletReservation $e');
    } finally {
      isDataLoading(false);
    }
    return null;
  }

// chooseServices() async {
//
// }
}
