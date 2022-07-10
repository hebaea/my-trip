import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/category_destinations.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/routes/app_pages.dart';

class HotelsController extends GetxController {
  CategoryDestinations? destinationList;
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

  getHotelsFromApi(int id) async {
    try {
      isDataLoading(true);
      http.Response response = await http
          .get(Uri.parse("$baseUrl/category_show_details/$id"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationList = CategoryDestinations.fromJson(result);
        Get.toNamed(Routes.HOTELS);
        print(result);
        print(response.statusCode);
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
