import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/city_show_destinations.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class CityDestinationsController extends GetxController {
  CityShowDestinations? destinationList;
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

  getCityDestinations(int id) async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.parse("$baseUrl/city_show_details/$id"),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationList = CityShowDestinations.fromJson(result);
        Get.toNamed(Routes.CITY_DESTINATIONS);
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
