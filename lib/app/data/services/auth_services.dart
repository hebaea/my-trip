import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/user_model.dart';

class AuthServices {
  static String baseApi = "https://mytrip.justhost.ly/api";
  static var client = http.Client();

  static Future<UserModel?> register(
      {required name, required email, required password}) async {
    var response = await client.post(
      Uri.parse("$baseApi/guest_register"),
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
      Uri.parse("$baseApi/guest_login"),
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

  static Future<UserModel?> fetchUserNameAndEmail() async {
    final response = await http.get(
      Uri.parse('$baseApi/guest_show/{guest_id}'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<UserModel?> update({required name, required email}) async {
    var response = await client.post(
      Uri.parse("$baseApi/guest_update/{guest_id}"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "guest_name": name,
        "guest_email": email,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("-------------------here -----------------------------");
      print(response.body.toString());
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      print("-------------------else -----------------------------");
      return null;
    }
  }
}
