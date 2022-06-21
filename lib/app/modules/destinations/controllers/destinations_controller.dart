import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/destination_model.dart';
import 'package:http/http.dart' as http;

class DestinationsController extends GetxController {
  //All destinations
  DestinationModel? destinationList;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    getDestinationInformationFromApi();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getDestinationInformationFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse("$baseUrl/destination_index")!,
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        destinationList = DestinationModel.fromJson(result);
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
