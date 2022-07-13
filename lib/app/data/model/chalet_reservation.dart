class ChaletReservation {
  List<Chalets>? chalets;
  List<Services>? services;

  ChaletReservation({this.chalets, this.services});

  ChaletReservation.fromJson(Map<String, dynamic> json) {
    if (json['chalets'] != null) {
      chalets = <Chalets>[];
      json['chalets'].forEach((v) {
        chalets!.add(Chalets.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chalets != null) {
      data['chalets'] = chalets!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chalets {
  int? chaletId;
  String? chaletLocation;
  String? numberOfPeople;
  int? chaletPrice;

  Chalets(
      {this.chaletId,
      this.chaletLocation,
      this.numberOfPeople,
      this.chaletPrice});

  Chalets.fromJson(Map<String, dynamic> json) {
    chaletId = json['chalet_id'];
    chaletLocation = json['chalet_location'];
    numberOfPeople = json['number_of_people'];
    chaletPrice = json['chalet_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chalet_id'] = chaletId;
    data['chalet_location'] = chaletLocation;
    data['number_of_people'] = numberOfPeople;
    data['chalet_price'] = chaletPrice;
    return data;
  }
}

class Services {
  int? serviceId;
  String? serviceName;
  int? servicePrice;

  Services({this.serviceId, this.serviceName, this.servicePrice});

  Services.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_price'] = servicePrice;
    return data;
  }
}
