class DestinationModel {
  List<Destianation>? destianation;

  DestinationModel({this.destianation});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    if (json['destianation'] != null) {
      destianation = <Destianation>[];
      json['destianation'].forEach((v) {
        destianation!.add(Destianation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (destianation != null) {
      data['destianation'] = destianation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destianation {
  int? destinationId;
  String? ownerName;
  int? hostId;
  int? categoryId;
  int? cityId;
  String? destinationAddress;
  String? destinationImg;
  bool? destinationStauts;
  String? destinationEvaluation;
  bool? destinationFavorite;

  Destianation({
    this.destinationId,
    this.ownerName,
    this.hostId,
    this.categoryId,
    this.cityId,
    this.destinationAddress,
    this.destinationImg,
    this.destinationStauts,
    this.destinationEvaluation,
    this.destinationFavorite,
  });

  Destianation.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    ownerName = json['owner_name'];
    hostId = json['host_id'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationStauts = json['destination_stauts'];
    destinationEvaluation = json['destination_evaluation'];
    destinationFavorite = json['destination_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['owner_name'] = ownerName;
    data['host_id'] = hostId;
    data['category_id'] = categoryId;
    data['city_id'] = cityId;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_stauts'] = destinationStauts;
    data['destination_evaluation'] = destinationEvaluation;
    data['destination_favorite'] = destinationFavorite;
    return data;
  }
}
