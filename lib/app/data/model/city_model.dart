// class CityModel {
//   List<City>? city;
//
//   CityModel({this.city});
//
//   CityModel.fromJson(Map<String, dynamic> json) {
//     if (json['city'] != null) {
//       city = <City>[];
//       json['city'].forEach((v) {
//         city!.add(City.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['city'] = city!.map((v) => v.toJson()).toList();
//     return data;
//   }
// }
//
// class City {
//   int? cityId;
//   String? cityName;
//
//   City({this.cityId, this.cityName});
//
//   City.fromJson(Map<String, dynamic> json) {
//     cityId = json['city_id'];
//     cityName = json['city_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['city_id'] = cityId;
//     data['city_name'] = cityName;
//     return data;
//   }
// }
class CityModel {
  List<City> city = [];

  CityModel({required this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    print("-------------------cityList json-----------------------------");

    print(json['city'].toString());
    if (json['city'] != null) {
      // city = <City>[];
      json['city'].forEach((v) {
        city.add(City.fromJson(v));
      });
      print("-------------------city json-----------------------------");

      print(city.toString());

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? cityId;
  String? cityName;
  String? createdAt;
  String? updatedAt;

  City({this.cityId, this.cityName, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}