class CityModel {
  List<City>? city;

  CityModel({this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['city'] != null) {
      city = <City>[];
      json['city'].forEach((v) {
        city!.add(City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city!.map((v) => v.toJson()).toList();
    return data;
  }
}

class City {
  int? cityId;
  String? cityName;

  City({this.cityId, this.cityName});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    return data;
  }
}
