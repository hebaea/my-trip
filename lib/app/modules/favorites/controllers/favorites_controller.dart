import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/favorite_create.dart';
import 'package:my_trip/app/data/model/favorite_show.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/favorite_validation.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';

class FavoritesController extends GetxController {
  final destinationdetails = Get.find<DestinationDetailsController>();
  FavoriteShow? favoriteList;
  var favoritesList = <Destination>[].obs;
  CreateFavorite? createFavorite;

  var isDataLoading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    var guestId = storage.read('id');
    print("this is guestId id ${guestId}");

    // getUserFavorites(guestId);
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
    await getUserFavorites();
  }

  getUserFavorites() async {
    var guestId = storage.read('id');

    print("igot here in get user favorites ");
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.parse("$baseUrl/favorite_show/$guestId"),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);

        favoriteList = FavoriteShow.fromJson(result);
        favoritesList.value = favoriteList?.destination as List<Destination>;
        print(favoriteList);
      } else {
        //error
        print("-------------------else -----------------------------");
        return null;
      }
    } catch (e) {
      print('error while getting data $e');
    } finally {
      isDataLoading(false);
    }
  }

  static var client = http.Client();

  Future favorite({
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
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      destinationdetails.isFavoriteLocal.value = 1;
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
      await favorite(guestId: guestId, destinationId: destinationId);
    } catch (e) {
      print('error $e');
    } finally {
      isDataLoading(false);
    }
  }

  Future unFavorite({
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
      print(
          "--reservations => ${favoritesList.value}------------------------------");
      favoritesList
          .removeWhere((element) => element.destinationId == destinationId);
      destinationdetails.isFavoriteLocal.value = 0;

      print(
          "--reservations => ${favoritesList.value}------------------------------");
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
      await unFavorite(guestId: guestId, destinationId: destinationId);
      get();
    } catch (e) {
      print('error  $e');
    } finally {
      isDataLoading(false);
    }
  }
}
