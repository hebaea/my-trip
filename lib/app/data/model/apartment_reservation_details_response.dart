class ApartmentReservationDetails {
  int? reservationableType;
  Apartment? apartment;
  List<Service>? service;

  ApartmentReservationDetails(
      {this.reservationableType, this.apartment, this.service});

  ApartmentReservationDetails.fromJson(Map<String, dynamic> json) {
    reservationableType = json['reservationable_type'];
    apartment = json['apartment'] != null
        ? Apartment.fromJson(json['apartment'])
        : null;
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['reservationable_type'] = reservationableType;
    if (apartment != null) {
      data['apartment'] = apartment!.toJson();
    }
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Apartment {
  int? apartmentId;
  String? apartmentName;
  int? apartmentPrice;
  int? apartmentStauts;

  Apartment(
      {this.apartmentId,
      this.apartmentName,
      this.apartmentPrice,
      this.apartmentStauts});

  Apartment.fromJson(Map<String, dynamic> json) {
    apartmentId = json['apartment_id'];
    apartmentName = json['apartment_name'];
    apartmentPrice = json['apartment_price'];
    apartmentStauts = json['apartment_stauts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apartment_id'] = apartmentId;
    data['apartment_name'] = apartmentName;
    data['apartment_price'] = apartmentPrice;
    data['apartment_stauts'] = apartmentStauts;
    return data;
  }
}

class Service {
  int? serviceReservationsId;
  int? serviceId;
  int? price;

  Service({this.serviceReservationsId, this.serviceId, this.price});

  Service.fromJson(Map<String, dynamic> json) {
    serviceReservationsId = json['service_reservations_id'];
    serviceId = json['service_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['service_reservations_id'] = serviceReservationsId;
    data['service_id'] = serviceId;
    data['price'] = price;
    return data;
  }
}
