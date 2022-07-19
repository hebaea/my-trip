import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/category_destinations.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/routes/app_pages.dart';

class ResortsController extends GetxController {
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

  getResortsFromApi(int id) async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.parse("$baseUrl/category_show_details/$id"),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationList = CategoryDestinations.fromJson(result);
        Get.toNamed(Routes.RESORTS);
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
