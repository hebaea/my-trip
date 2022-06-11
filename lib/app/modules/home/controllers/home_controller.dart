import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/city_model.dart';

class HomeController extends GetxController {
  CityModel? cityList;

  @override
  void onInit() {
    getCityInformationFromApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getCityInformationFromApi() async {
    http.Response response = await http.get(
        Uri.tryParse("https://mytrip.justhost.ly/api/city_index")!,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("-------------------here -----------------------------");
      print(response.body.toString());
      var result = jsonDecode(response.body);
      cityList = CityModel.fromJson(result);
    } else {
      print("-------------------else -----------------------------");
      return null;
    }
  }
}
