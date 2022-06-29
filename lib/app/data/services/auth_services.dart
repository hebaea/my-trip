import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/data/model/user_model.dart';

import '../model/email_validation.dart';

class AuthServices {
  static var client = http.Client();

  static Future<UserModel?> register(
      {required name, required email, required password}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<dynamic, dynamic>{
        "guest_name": name,
        "guest_email": email,
        "guest_password": password
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print(response.body.toString());
      // var res = await json.decode(response.body);
      // print(res);
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else if (response.statusCode == 400) {
      GuestEmailValidation? emailValidation;
      var result = jsonDecode(response.body);
      emailValidation = GuestEmailValidation.fromJson(result);
      return customSnackbar(
          "تسجيل حساب جديد", emailValidation.guestEmail?.first, "error");
    } else {
      return null;
    }
  }

  static Future<UserModel?> login({required email, password}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          <String, String>{"guest_email": email, "guest_password": password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else if (response.statusCode == 400) {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar(
          "تسجيل الدخول", messageFromBackend.message, "error");
    } else {
      return null;
    }
  }

  static Future<UserModel?> update(
      {required name, required email, required id}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_update/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
      body: jsonEncode(<String, String>{
        "guest_name": name,
        "guest_email": email,
      }),
    );

    var result = await json.decode(json.encode(response.body));
    print(
        "------------------- state ${response.statusCode} ---------------------- ");
    print("------------------- res ${result} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar(
          "تعديل بيانات الحساب", messageFromBackend.message, "success");
    } else {
      MessageFromBackend? messageFromBackend;
      var result = jsonDecode(response.body);
      messageFromBackend = MessageFromBackend.fromJson(result);
      return customSnackbar(
          "تعديل بيانات الحساب", messageFromBackend.message, "error");
    }
  }

  static Future<UserModel?> updatePassword(
      {required password, required id}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_change_password/$id"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "guest_password": password,
      }),
    );

    var result = await json.decode(json.encode(response.body));
    print(
        "------------------- state ${response.statusCode} ---------------------- ");
    print("------------------- res ${result} ---------------------- ");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return customSnackbar(
          "تعديل كلمة المرور", "تم تعديل كلمة المرور بنجاح", "success");
    } else {
      return customSnackbar(
          "تعديل كلمة المرور", "مشكلة في تعديل كلمة المرور", "error");
    }
  }
}
