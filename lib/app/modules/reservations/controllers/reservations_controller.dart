import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/show_guest_reservations.dart';

class ReservationsController extends GetxController {
  static var client = http.Client();
  final storage = GetStorage();

  ReservationShowGuest? guestReservationList;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    var guestId = storage.read('id');
    print("this is guestId id ${guestId}");
    showReservations(guestId: guestId);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future showReservations({required guestId}) async {
    try {
      isDataLoading(true);

      var response = await client.post(
        Uri.parse("$baseUrl/reservation_show_guest/$guestId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json"
        },
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        guestReservationList = ReservationShowGuest.fromJson(result);
        print(guestReservationList);
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
}
