import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/destination_model.dart';

class CityServices {
  static String baseApi = "https://mytrip.justhost.ly/api";
  static var client = http.Client();

  static Future<Destianation?> showCityDestinations({required id}) async {
    var response = await client.get(
      Uri.parse("$baseApi/city_show_details/$id"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("-------------------password----------------------------");
      print(response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Destianation.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
