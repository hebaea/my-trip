class DestinationDetails {
  int? destinationId;
  String? destinationName;
  int? categoryId;
  String? categoryName;
  String? cityName;
  String? hostEmail;
  String? hostPhone;
  String? destinationAddress;
  String? destinationImg;
  int? destinationEvaluation;
  int? isFavorite;

  DestinationDetails(
      {this.destinationId,
      this.destinationName,
      this.categoryId,
      this.categoryName,
      this.cityName,
      this.hostEmail,
      this.hostPhone,
      this.destinationAddress,
      this.destinationImg,
      this.destinationEvaluation,
      this.isFavorite});

  DestinationDetails.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    destinationName = json['destination_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    cityName = json['city_name'];
    hostEmail = json['host_email'];
    hostPhone = json['host_phone'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationEvaluation = json['destination_evaluation'];
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['destination_name'] = destinationName;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['city_name'] = cityName;
    data['host_email'] = hostEmail;
    data['host_phone'] = hostPhone;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_evaluation'] = destinationEvaluation;
    data['is_favorite'] = isFavorite;
    return data;
  }
}
