import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/hotel_reservation_details.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/routes/app_pages.dart';

import '../../apartment_reservation_details/controllers/apartment_reservation_details_controller.dart';
import '../../chalet_reservation_details/controllers/chalet_reservation_details_controller.dart';
import '../../reservations/controllers/reservations_controller.dart';

class HotelReservationDetailsController extends GetxController {
  HotelReservationDetails? hotelReservationDetails;
  static var client = http.Client();
  final storage = GetStorage();
  final apartmentReservationDetailsController =
      Get.find<ApartmentReservationDetailsController>();

  final controller = Get.find<ReservationsController>();

  final chaletReservationDetailsController =
      Get.find<ChaletReservationDetailsController>();
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

  Future getHotelReservationDetails(reservationId, i) async {
    print(
        " ======reservationId====getReservationDetails====== in services $reservationId ");

    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.parse("$baseUrl/reservation_details/$reservationId"),
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json"
        },
      );
      print(
          "------------------- state ${response.statusCode} ---------------------- ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            "im here ---------------200----------------------------------------------------------");

        var result = jsonDecode(response.body);
        hotelReservationDetails = HotelReservationDetails.fromJson(result);
        print(
            "----hotelReservationDetails = ${hotelReservationDetails}--------");

        switch (hotelReservationDetails?.reservationableType) {
          case (1):
            Get.toNamed(Routes.HOTEL_RESERVATION_DETAILS);
            break;
          case (2):
            apartmentReservationDetailsController
                .getApartmentReservationDetails(
                    reservationId: controller
                        .guestReservationList!.reservations![i].reservationId);
            break;
          case (3):
            chaletReservationDetailsController.getChaletReservationDetails(
              reservationId: controller
                  .guestReservationList!.reservations![i].reservationId,
            );
            break;
        }

        print(result);
      }
      {
        return null;
      }
    } catch (e) {
      print('error while getting  HotelReservationDetails DATA $e');
    } finally {
      isDataLoading(false);
    }
  }

// Future getHotelDetails(int? reservationId) async {
//   print("getHotelDetails");
//   print(" =====getHotelDetails=========== $reservationId ");
//   isDataLoading(true);
//   try {
//     await getHotelReservationDetails(reservationId);
//     print(
//         "im here ------------------in getDetails----------------------------");
//   } catch (e) {
//     print('$e');
//   } finally {
//     isDataLoading(false);
//   }
// }
}
