import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/category_destinations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_trip/app/routes/app_pages.dart';

class ApartmentsController extends GetxController {
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

  getApartmentsFromApi(int id) async {
    isDataLoading(true);
    try {
      http.Response response = await http.get(
          Uri.tryParse("$baseUrl/category_show_details/$id")!,
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationList = CategoryDestinations.fromJson(result);
        Get.toNamed(Routes.APARTMENTS);
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
