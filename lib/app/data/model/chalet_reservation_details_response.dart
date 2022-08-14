class ChaletReservationDetails {
  int? reservationableType;
  List<Chalet>? chalet;
  List<Service>? service;

  ChaletReservationDetails(
      {this.reservationableType, this.chalet, this.service});

  ChaletReservationDetails.fromJson(Map<String, dynamic> json) {
    reservationableType = json['reservationable_type'];
    if (json['chalet'] != null) {
      chalet = <Chalet>[];
      json['chalet'].forEach((v) {
        chalet!.add(Chalet.fromJson(v));
      });
    }
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reservationable_type'] = reservationableType;
    if (chalet != null) {
      data['chalet'] = chalet!.map((v) => v.toJson()).toList();
    }
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chalet {
  int? destinationReservationId;
  int? reservationId;
  int? reservationableId;
  int? price;

  Chalet(
      {this.destinationReservationId,
      this.reservationId,
      this.reservationableId,
      this.price});

  Chalet.fromJson(Map<String, dynamic> json) {
    destinationReservationId = json['destination_reservation_id'];
    reservationId = json['reservation_id'];
    reservationableId = json['reservationable_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_reservation_id'] = destinationReservationId;
    data['reservation_id'] = reservationId;
    data['reservationable_id'] = reservationableId;
    data['price'] = price;
    return data;
  }
}

class Service {
  int? serviceReservationsId;
  int? serviceId;
  String? serviceName;
  int? price;

  Service({this.serviceReservationsId, this.serviceId, this.price,this.serviceName});

  Service.fromJson(Map<String, dynamic> json) {
    serviceReservationsId = json['service_reservations_id'];
    serviceId = json['service_id'];
    serviceName=json['service_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_reservations_id'] = serviceReservationsId;
    data['service_id'] = serviceId;
    data['service_name']=serviceName;
    data['price'] = price;
    return data;
  }
}
