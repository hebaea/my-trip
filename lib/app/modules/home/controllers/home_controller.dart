import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/city_model.dart';

class HomeController extends GetxController {
  CityModel? cityList;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    getCities();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getCities() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse("$baseUrl/city_index")!,
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        cityList = CityModel.fromJson(result);
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
