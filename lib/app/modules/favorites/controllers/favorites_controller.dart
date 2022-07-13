import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/favorite_show.dart';
import 'package:http/http.dart' as http;

class FavoritesController extends GetxController {
  FavoriteShow? favoriteList;

  var isDataLoading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    var guestId = storage.read('id');
    print("this is guestId id ${guestId}");

    getUserFavorites(guestId);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getUserFavorites(int id) async {
    print("igot here in get user favorites ");
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.parse("$baseUrl/favorite_show/$id"),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        favoriteList = FavoriteShow.fromJson(result);
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
}
