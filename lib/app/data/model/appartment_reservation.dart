class ApartmentReservation {
  List<Apartment>? apartment;
  List<Services>? services;

  ApartmentReservation({this.apartment, this.services});

  ApartmentReservation.fromJson(Map<String, dynamic> json) {
    if (json['apartment'] != null) {
      apartment = <Apartment>[];
      json['apartment'].forEach((v) {
        apartment!.add(Apartment.fromJson(v));
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
    if (apartment != null) {
      data['apartment'] = apartment!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Apartment {
  int? apartmentId;
  int? apartmentPrice;

  Apartment({this.apartmentId, this.apartmentPrice});

  Apartment.fromJson(Map<String, dynamic> json) {
    apartmentId = json['apartment_id'];
    apartmentPrice = json['apartment_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apartment_id'] = apartmentId;
    data['apartment_price'] = apartmentPrice;
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
