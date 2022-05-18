import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  // final _email = '';
  // final _password = '';

  final count = 0.obs;

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

  // loginPressed() async {
  //   if (_email.isNotEmpty && _password.isNotEmpty) {
  //     http.Response response = await AuthServices.login(_email, _password);
  //     Map responseMap = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       Get.to(const HomeView());
  //     } else {
  //       //errorSnackBar(context, responseMap.values.first);
  //       print(responseMap.values.first);
  //     }
  //   } else {
  //     //errorSnackBar(context, );
  //     print('enter all required fields');
  //   }
  // }
}
