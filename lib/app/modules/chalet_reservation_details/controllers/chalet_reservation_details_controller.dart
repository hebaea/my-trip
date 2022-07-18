import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/chalet_reservation_details_response.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ChaletReservationDetailsController extends GetxController {
  static var client = http.Client();
  ChaletReservationDetails? chaletReservationDetails; //this one
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

  Future getChaletReservationDetails({
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
      chaletReservationDetails = ChaletReservationDetails.fromJson(result);

      print(
          "----------chaletReservationDetails $result-------------------------");
      Get.toNamed(Routes.CHALET_RESERVATION_DETAILS);
    } else if (response.statusCode == 400) {}
  }

  getChaletDetails(int? reservationId) async {
    print("getChaletDetails");
    print(" =====getChaletDetails=========== $reservationId ");
    isDataLoading(true);
    try {
      await getChaletReservationDetails(reservationId: reservationId);
      print(
          "im here ------------------in getDetails----------------------------");
    } catch (e) {
      print('$e');
    } finally {
      isDataLoading(false);
    }
  }
}
