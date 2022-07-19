import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/data/model/show_guest_reservations.dart';

class ReservationsController extends GetxController {
  static var client = http.Client();
  final storage = GetStorage();
  ReservationShow? guestReservationList;
  var guestList = <Reservations>[].obs;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    var guestId = storage.read('id');
    print("this is guestId id ${guestId}");
    //getUserReservations(guestId: guestId);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  get() async {
    print("=============== HERE Get ======================");
    await getUserReservations();
  }

  Future getUserReservations() async {
    try {
      var guestId = storage.read('id');
      isDataLoading(true);

      var response = await client.get(
        Uri.parse("$baseUrl/reservation_show_guest/$guestId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json"
        },
      );

      var result = await json.decode(response.body);
      print(
          "------------------- state ${response.statusCode} ---------------------- ");
      print(
          "------------------- res ${result} ------$guestId---------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        guestReservationList = ReservationShow.fromJson(result);
        guestList.value =
            guestReservationList?.reservations as List<Reservations>;
        //////////////////////////
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

  Future deleteReservation({
    required reservationId,
  }) async {
    print(" ======reservationId========== in services $reservationId ");

    var response = await client.post(
      Uri.parse("$baseUrl/delete_reservation/$reservationId"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
    );

    print(
        "------------------- state ${response.statusCode} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "--reservations => ${guestList.value}------------------------------");
      guestList
          .removeWhere((element) => element.destinationId == reservationId);
      print(
          "--reservations => ${guestList.value}------------------------------");

      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar(
          "إلغاء الحجز", messageFromBackend.message, "success");
    } else if (response.statusCode == 400) {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar("إلغاء الحجز", messageFromBackend.message, "error");
    }
  }

  makeDeleteReservation(int? reservationId) async {
    print(" ================ $reservationId ");
    isDataLoading(true);
    try {
      await deleteReservation(reservationId: reservationId);
      get();
    } catch (e) {
      print('$e');
    } finally {
      isDataLoading(false);
    }
  }
}
