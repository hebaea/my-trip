import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/user_model.dart';

class AuthServices {
  // static String baseApi = "https://mytrip.justhost.ly/api";
  static var client = http.Client();

  static Future<UserModel?> register(
      {required name, required email, required password}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "guest_name": name,
        "guest_email": email,
        "guest_password": password
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("-------------------here -----------------------------");
      print(response.body.toString());
      var res = await json.decode(response.body);
      print(res);
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      print("-------------------else -----------------------------");
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
    } else {
      return null;
    }
  }

  static Future<UserModel?> update(
      {required name, required email, required id}) async {
    var response = await client.post(
      Uri.parse("$baseUrl/guest_update/$id"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "guest_name": name,
        "guest_email": email,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print("-------------------here -----------------------------");
      print(response.body.toString());
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      // print("-------------------else -----------------------------");
      return null;
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("-------------------password----------------------------");
      print(response.body.toString());
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }
}
