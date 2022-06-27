class DestinationDetails {
  String? categoryName;
  String? cityName;
  String? hostEmail;
  String? hostPhone;
  String? destinationAddress;
  String? destinationImg;
  String? destinationEvaluation;
  bool? destinationFavorite;

  DestinationDetails(
      {this.categoryName,
      this.cityName,
      this.hostEmail,
      this.hostPhone,
      this.destinationAddress,
      this.destinationImg,
      this.destinationEvaluation,
      this.destinationFavorite});

  DestinationDetails.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    cityName = json['city_name'];
    hostEmail = json['host_email'];
    hostPhone = json['host_phone'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationEvaluation = json['destination_evaluation'];
    destinationFavorite = json['destination_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['city_name'] = cityName;
    data['host_email'] = hostEmail;
    data['host_phone'] = hostPhone;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_evaluation'] = destinationEvaluation;
    data['destination_favorite'] = destinationFavorite;
    return data;
  }
}
