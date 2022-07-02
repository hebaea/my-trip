import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/destination_details.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/destination_model.dart';
import 'package:my_trip/app/data/model/favorite_create.dart';
import 'package:my_trip/app/data/model/favorite_validation.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class DestinationDetailsController extends GetxController {
  var isDataLoading = false.obs;
  DestinationDetails? destinationDetails;

  // Destination? destination;
  // UserModel? user;
  CreateFavorite? createFavorite;

  // var isFavorite = false.obs;
  // final storage = GetStorage();

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

  getDestinationDetails(int id, int guestId) async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.parse("$baseUrl/destination_details/$guestId/$id"),
        headers: {'Content-Type': 'application/json'},
        // body: jsonEncode(<dynamic, int>{
        //   "guest_id": guestId,
        // }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationDetails = DestinationDetails.fromJson(result);
        Get.toNamed(Routes.DESTINATION_DETAILS);
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

  static var client = http.Client();

  static Future favorite({
    required guestId,
    required destinationId,
  }) async {
    print(" ================ in services $guestId and $destinationId");

    var response = await client.post(
      Uri.parse("$baseUrl/favorite_create"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
      body: jsonEncode(<dynamic, dynamic>{
        "guest_id": guestId,
        "destination_id": destinationId,
      }),
    );

    print(
        "------------------- state ${response.statusCode} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "im here -------------------------------------------------------------------------");

      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar("المفضلة", messageFromBackend.message, "success");
    } else if (response.statusCode == 400) {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar("المفضلة", messageFromBackend.message, "error");
    } else {
      FavoriteValidation? favoriteValidation;
      var result = jsonDecode(response.body);
      favoriteValidation = FavoriteValidation.fromJson(result);
      return customSnackbar(
          "المفضلة",
          "${favoriteValidation.destinationId?.first} \n ${favoriteValidation.guestId?.first}",
          "error");
    }
  }

  makeFavorite(int? guestId, int? destinationId) async {
    print(" ================ $guestId and $destinationId");

    isDataLoading(true);

    try {
      // isFavorite(true);

      await favorite(guestId: guestId, destinationId: destinationId);
      print(
          "im here ------------------in favorite-------------------------------------------------------");
      // print("isFavorite:");
      // print(isFavorite);
      // print("isFavorite.value:");
      // print(isFavorite.value);
      //
      // await storage.write("isFavorite", isFavorite.value);
      // var fav = storage.read("isFavorite");
      // print("fav : ");
      // print(fav);
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>");
      print('error >>>>>>>>>>>> $e');
    } finally {
      isDataLoading(false);
    }
  }

  static Future unfavorite({
    required guestId,
    required destinationId,
  }) async {
    print(" ================ in services $guestId and $destinationId");

    var response = await client.post(
      Uri.parse("$baseUrl/unfavorite"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
      body: jsonEncode(<dynamic, dynamic>{
        "guest_id": guestId,
        "destination_id": destinationId,
      }),
    );

    print(
        "------------------- state ${response.statusCode} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "im here -------------------------------------------------------------------------");

      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar("المفضلة", messageFromBackend.message, "success");
    } else if (response.statusCode == 400) {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar("المفضلة", messageFromBackend.message, "error");
    } else {
      FavoriteValidation? favoriteValidation;
      var result = jsonDecode(response.body);
      favoriteValidation = FavoriteValidation.fromJson(result);
      return customSnackbar(
          "المفضلة",
          "${favoriteValidation.destinationId?.first} \n ${favoriteValidation.guestId?.first}",
          "error");
    }
  }

  makeunFavorite(int? guestId, int? destinationId) async {
    print(" ================ $guestId and $destinationId");

    isDataLoading(true);

    try {
      // isFavorite(true);

      await unfavorite(guestId: guestId, destinationId: destinationId);
      print(
          "im here ------------------in UNfavorite-------------------------------------------------------");
      // print("isFavorite:");
      // print(isFavorite);
      // print("isFavorite.value:");
      // print(isFavorite.value);
      //
      // await storage.write("isFavorite", isFavorite.value);
      // var fav = storage.read("isFavorite");
      // print("fav : ");
      // print(fav);
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>");
      print('error >>>>>>>>>>>> $e');
    } finally {
      isDataLoading(false);
    }
  }
}
