// import 'dart:convert';
// import 'package:my_trip/app/data/services/globals.dart';
// import 'package:http/http.dart' as http;
//
// class AuthServices {
//   static Future<http.Response> register(
//       String name, String email, String password) async {
//     Map data = {
//       "name": name,
//       "email": email,
//       "password": password,
//     };
//     var body = json.encode(data);
//     var url = Uri.parse(baseURL + 'auth/register');
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
//
//   static Future<http.Response> login(String email, String password) async {
//     Map data = {
//       "email": email,
//       "password": password,
//     };
//     var body = json.encode(data);
//     var url = Uri.parse(baseURL + 'auth/login');
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/user_model.dart';

class AuthServices {
  static String baseApi = "http://127.0.0.1:8000/api/";
  static var client = http.Client();

  static register({required name, required email, required password}) async {
    var response = await client.post(
      Uri.parse("$baseApi/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          <String, String>{"name": name, "email": email, "password": password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }

  static login({required email, password}) async {
    var response = await client.post(
      Uri.parse("$baseApi/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    }
  }
}
