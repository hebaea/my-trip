import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/destination_details.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/routes/app_pages.dart';

class DestinationDetailsController extends GetxController {
  var isDataLoading = false.obs;
  DestinationDetails? destinationDetails;

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

  getDestinationDetails(int id) async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse("$baseUrl/destination_details/$id")!,
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('pppppppppppppppppppppppppppppppppppppppppp');
        print(
            "---------show Destinations Details---- i got here-------------------");
        print(jsonDecode(response.body));
        var result = jsonDecode(response.body);
        destinationDetails = DestinationDetails.fromJson(result);
        Get.toNamed(Routes.DESTINATION_DETAILS);
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
