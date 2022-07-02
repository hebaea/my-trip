class FavoriteShow {
  List<Destination>? destination;

  FavoriteShow({this.destination});

  FavoriteShow.fromJson(Map<String, dynamic> json) {
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

  int? categoryId;
  String? destinationAddress;
  String? destinationImg;
  String? destinationEvaluation;

  Destination(
      {this.destinationId,
      this.destinationName,
      this.categoryId,
      this.destinationAddress,
      this.destinationImg,
      this.destinationEvaluation});

  Destination.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    destinationName = json['destination_name'];
    categoryId = json['category_id'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationEvaluation = json['destination_evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['destination_name'] = destinationName;
    data['category_id'] = categoryId;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_evaluation'] = destinationEvaluation;
    return data;
  }
}
