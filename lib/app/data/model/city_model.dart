class CityModel {
  List<City> city = [];

  CityModel({required this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['city'] != null) {
      city = <City>[];
      json['city'].forEach((v) {
        city.add(City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city.map((v) => v.toJson()).toList();
    return data;
  }
}

class City {
  int? cityId;
  String? cityName;
  String? cityImg;

  City({this.cityId, this.cityName, this.cityImg});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    cityImg = json['city_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['city_img'] = cityImg;
    return data;
  }
}
