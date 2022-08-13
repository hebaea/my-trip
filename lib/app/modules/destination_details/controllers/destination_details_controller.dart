import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/chat_create_response.dart';
import 'package:my_trip/app/data/model/destination_details.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import 'package:rating_dialog/rating_dialog.dart';

class DestinationDetailsController extends GetxController {
  var isDataLoading = false.obs;
  DestinationDetails? destinationDetails;

  late var isFavoriteLocal = destinationDetails!.isFavorite.obs;
  var rating = 0.obs;


  // CreateFavorite? createFavorite;

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

  getDestinationDetails(int? id, int? guestId) async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.parse("$baseUrl/destination_details/$guestId/$id"),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationDetails = DestinationDetails.fromJson(result);
        Get.toNamed(Routes.DESTINATION_DETAILS);
        print(result);
      }
      {
        return null;
      }
    } catch (e) {
      print('error while getting DESTINATION DETAILS DATA $e');
    } finally {
      isDataLoading(false);
    }
  }

  rateDestination(int guestId, int? destinationId) {
    Get.dialog(RatingDialog(
      enableComment: false,
      title: const Text('تقييم الوجهة'),
      submitButtonText: 'تقييم',
      onSubmitted: (response) {
        rating.value = response.rating.toInt();
        doRateDestination(guestId, destinationId);
      },
    ));
  }

  doRateDestination(int guestId, int? destinationId) async {
    try {
      isDataLoading(true);

      http.Response response = await http.post(
        Uri.parse("$baseUrl/destination_evaluation/$destinationId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
        body: jsonEncode(
            <dynamic, dynamic>{"guest_id": guestId, "rate": rating.value}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        MessageFromBackend? messageFromBackend;
        var result = jsonDecode(response.body);
        messageFromBackend = MessageFromBackend.fromJson(result);
        return customSnackbar("تقييم", messageFromBackend.message, "success");
      } else if (response.statusCode == 400) {
        MessageFromBackend? messageFromBackend;
        var result = jsonDecode(response.body);
        messageFromBackend = MessageFromBackend.fromJson(result);
        return customSnackbar("تقييم", messageFromBackend.message, "error");
      }
      {
        return null;
      }
    } catch (e) {
      print('error while rating $e');
    } finally {
      isDataLoading(false);
    }
  }

// static var client = http.Client();
//
// static Future favorite({
//   required guestId,
//   required destinationId,
// }) async {
//   print(" ================ in services $guestId and $destinationId");
//
//   var response = await client.post(
//     Uri.parse("$baseUrl/favorite_create"),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': "application/json"
//     },
//     body: jsonEncode(<dynamic, dynamic>{
//       "guest_id": guestId,
//       "destination_id": destinationId,
//     }),
//   );
//
//   print(
//       "------------------- state ${response.statusCode} ---------------------- ");
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//
//     MessageFromBackend? messageFromBackend;
//     var result = jsonDecode(response.body);
//     messageFromBackend = MessageFromBackend.fromJson(result);
//     return customSnackbar("المفضلة", messageFromBackend.message, "success");
//   } else if (response.statusCode == 400) {
//     MessageFromBackend? messageFromBackend;
//     var result = jsonDecode(response.body);
//     messageFromBackend = MessageFromBackend.fromJson(result);
//     return customSnackbar("المفضلة", messageFromBackend.message, "error");
//   } else {
//     FavoriteValidation? favoriteValidation;
//     var result = jsonDecode(response.body);
//     favoriteValidation = FavoriteValidation.fromJson(result);
//     return customSnackbar(
//         "المفضلة",
//         "${favoriteValidation.destinationId?.first} \n ${favoriteValidation.guestId?.first}",
//         "error");
//   }
// }
//
// makeFavorite(int? guestId, int? destinationId) async {
//   print(" ================ $guestId and $destinationId");
//
//   isDataLoading(true);
//
//   try {
//
//     await favorite(guestId: guestId, destinationId: destinationId);
//
//   } catch (e) {
//     print('error $e');
//   } finally {
//     isDataLoading(false);
//   }
// }
//
// static Future unFavorite({
//   required guestId,
//   required destinationId,
// }) async {
//   print(" ================ in services $guestId and $destinationId");
//
//   var response = await client.post(
//     Uri.parse("$baseUrl/unfavorite"),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': "application/json"
//     },
//     body: jsonEncode(<dynamic, dynamic>{
//       "guest_id": guestId,
//       "destination_id": destinationId,
//     }),
//   );
//
//   print(
//       "------------------- state ${response.statusCode} ---------------------- ");
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     print(
//         "im here -------------------------------------------------------------------------");
//
//     MessageFromBackend? messageFromBackend;
//     var result = jsonDecode(response.body);
//     messageFromBackend = MessageFromBackend.fromJson(result);
//     return customSnackbar("المفضلة", messageFromBackend.message, "success");
//   } else if (response.statusCode == 400) {
//     MessageFromBackend? messageFromBackend;
//     var result = jsonDecode(response.body);
//     messageFromBackend = MessageFromBackend.fromJson(result);
//     return customSnackbar("المفضلة", messageFromBackend.message, "error");
//   } else {
//     FavoriteValidation? favoriteValidation;
//     var result = jsonDecode(response.body);
//     favoriteValidation = FavoriteValidation.fromJson(result);
//     return customSnackbar(
//         "المفضلة",
//         "${favoriteValidation.destinationId?.first} \n ${favoriteValidation.guestId?.first}",
//         "error");
//   }
// }
//
// makeunFavorite(int? guestId, int? destinationId) async {
//   print(" ================ $guestId and $destinationId");
//
//   isDataLoading(true);
//
//   try {
//
//     await unFavorite(guestId: guestId, destinationId: destinationId);
//   } catch (e) {
//     print('error  $e');
//   } finally {
//     isDataLoading(false);
//   }
// }
}
