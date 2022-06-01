// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class MyLocaleController extends GetxController {
//   final storage = GetStorage();
//
//   late Locale initialLang = storage.read("lang") == null
//       ? Get.deviceLocale!
//       : Locale(storage.read("lang"));
//
//   void changeLang(String langcode) {
//     Locale locale = Locale(langcode);
//     storage.write("lang", langcode);
//     Get.updateLocale(locale);
//   }
// }
