class FavoriteShow {
  int? destinationId;
  int? categoryId;
  String? destinationAddress;
  String? destinationImg;
  String? destinationEvaluation;

  FavoriteShow(
      {this.destinationId,
      this.categoryId,
      this.destinationAddress,
      this.destinationImg,
      this.destinationEvaluation});

  FavoriteShow.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    categoryId = json['category_id'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationEvaluation = json['destination_evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['category_id'] = categoryId;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_evaluation'] = destinationEvaluation;
    return data;
  }
}
