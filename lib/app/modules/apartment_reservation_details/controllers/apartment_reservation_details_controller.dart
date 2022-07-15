import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/apartment_reservation_details_response.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ApartmentReservationDetailsController extends GetxController {
  static var client = http.Client();
  ApartmentReservationDetails? apartmentReservationDetails;
  var isDataLoading = false.obs;

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

  Future getApartmentReservationDetails({
    required reservationId,
  }) async {
    print(
        " ======reservationId====getReservationDetails====== in services $reservationId ");

    var response = await client.get(
      Uri.parse("$baseUrl/reservation_details/$reservationId"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
    );

    print(
        "------------------- state ${response.statusCode} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "im here -------------------------------------------------------------------------");

      var result = jsonDecode(response.body);
      apartmentReservationDetails =
          ApartmentReservationDetails.fromJson(result);
      Get.toNamed(Routes.APARTMENT_RESERVATION_DETAILS);
    } else if (response.statusCode == 400) {}
  }

  getApartmentDetails(int? reservationId) async {
    print("getHotelDetails");
    print(" =====getHotelDetails=========== $reservationId ");
    isDataLoading(true);
    try {
      await getApartmentReservationDetails(reservationId: reservationId);
      print(
          "im here ------------------in getDetails----------------------------");
    } catch (e) {
      print('$e');
    } finally {
      isDataLoading(false);
    }
  }
}
