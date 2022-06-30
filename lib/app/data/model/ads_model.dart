class AdsModel {
  List<Ads>? ads;

  AdsModel({this.ads});

  AdsModel.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ads != null) {
      data['ads'] = ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ads {
  int? adsId;
  int? destinationId;
  String? adsImg;
  String? adsStartDate;
  int? adsStauts;

  Ads(
      {this.adsId,
      this.destinationId,
      this.adsImg,
      this.adsStartDate,
      this.adsStauts});

  Ads.fromJson(Map<String, dynamic> json) {
    adsId = json['ads_id'];
    destinationId = json['destination_id'];
    adsImg = json['ads_img'];
    adsStartDate = json['ads_start_date'];
    adsStauts = json['ads_stauts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ads_id'] = adsId;
    data['destination_id'] = destinationId;
    data['ads_img'] = adsImg;
    data['ads_start_date'] = adsStartDate;
    data['ads_stauts'] = adsStauts;
    return data;
  }
}
