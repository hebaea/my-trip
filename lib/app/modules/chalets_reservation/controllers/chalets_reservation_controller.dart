import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/chalet_reservation.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ChaletsReservationController extends GetxController {
  static var client = http.Client();
  ChaletReservation? chaletReservation;
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

  Future reservationShowChalet({required destinationId}) async {
    try {
      isDataLoading(true);

      var response = await http.post(
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

  chooseServices() async {
    Get.bottomSheet(
      Container(
        color: AppThemeColors.primaryPureWhite,
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            String serviceName = "";
            try {
              serviceName = chaletReservation!.services![i].serviceName!;
            } catch (e) {
              serviceName = "";
            }
            int servicePrice = 0;
            try {
              servicePrice = chaletReservation!.services![i].servicePrice!;
            } catch (e) {
              servicePrice = 0;
            }
            return Column(
              children: [
                SizedBox(height: 20.h),
                Obx(
                  () => CheckboxListTile(
                    title: DefaultText('اسم الخدمة : $serviceName'),
                    subtitle: DefaultText('سعر الخدمة : $servicePrice'),
                    activeColor: AppThemeColors.primaryColor,
                    value: checkBool.value,
                    onChanged: (value) {
                      checkBool.value = !checkBool.value;
                      print(checkBool.value);
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
          itemCount: chaletReservation?.services!.length,
        ),
      ),
    );
  }

  Future<MessageFromBackend?> makeChaletReservation(
      {required int? destinationId}) async {
    try {
      isDataLoading(true);

      int guestId = storage.read("id");
      String checkInDate =
          DateFormat("dd-MM-yyyy").format(dateRange.value.start);
      String checkOutDate =
          DateFormat("dd-MM-yyyy").format(dateRange.value.end);

      //TODO send services
      //TODO send rooms

      //TODO SELECTED SERVICE ID AND SELECTED SERVICE PRICE
      //TODO SELECTED chalets ID AND chalets SERVICE PRICE

      List<Services>? services;
      services = [];
      List<Chalets>? chalets;
      chalets = [];
      final response = await http.post(
        Uri.parse("$baseUrl/reservation_create/$destinationId"),
        headers: <String, String>{
          'Accept': "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "guest_id": guestId,
          "Checkin_date": checkInDate,
          "Checkout_date": checkOutDate,
          "services": services,
          "chalets": chalets
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
}
