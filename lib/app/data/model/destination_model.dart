class DestinationModel {
  List<Destination>? destination;

  DestinationModel({this.destination});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    if (json['destination'] != null) {
      destination = <Destination>[];
      json['destination'].forEach((v) {
        destination!.add(Destination.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (destination != null) {
      data['destination'] = destination!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destination {
  int? destinationId;
  String? destinationName;
  String? ownerName;
  int? hostId;
  int? categoryId;
  int? cityId;
  String? destinationAddress;
  String? destinationImg;
  bool? destinationStauts;
  double? destinationEvaluation;
  // bool? destinationFavorite;

  Destination({
    this.destinationId,
    this.destinationName,
    this.ownerName,
    this.hostId,
    this.categoryId,
    this.cityId,
    this.destinationAddress,
    this.destinationImg,
    this.destinationStauts,
    this.destinationEvaluation,
    // this.destinationFavorite,
  });

  Destination.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    destinationName = json['destination_name'];
    ownerName = json['owner_name'];
    hostId = json['host_id'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationStauts = json['destination_stauts'];
    destinationEvaluation = json['destination_evaluation'];
    // destinationFavorite = json['destination_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['destination_name'] = destinationName;
    data['owner_name'] = ownerName;
    data['host_id'] = hostId;
    data['category_id'] = categoryId;
    data['city_id'] = cityId;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_stauts'] = destinationStauts;
    data['destination_evaluation'] = destinationEvaluation;
    // data['destination_favorite'] = destinationFavorite;
    return data;
  }
}
