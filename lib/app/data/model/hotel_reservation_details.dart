class HotelReservationDetails {
  String? reservationableType;
  List<Room>? room;
  List<Service>? service;

  HotelReservationDetails({this.reservationableType, this.room, this.service});

  HotelReservationDetails.fromJson(Map<String, dynamic> json) {
    reservationableType = json['reservationable_type'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room!.add(Room.fromJson(v));
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
    if (room != null) {
      data['room'] = room!.map((v) => v.toJson()).toList();
    }
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  int? destinationReservationId;
  int? reservationId;
  int? reservationableId;
  int? price;

  Room(
      {this.destinationReservationId,
      this.reservationId,
      this.reservationableId,
      this.price});

  Room.fromJson(Map<String, dynamic> json) {
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
  int? price;

  Service({this.serviceReservationsId, this.serviceId, this.price});

  Service.fromJson(Map<String, dynamic> json) {
    serviceReservationsId = json['service_reservations_id'];
    serviceId = json['service_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_reservations_id'] = serviceReservationsId;
    data['service_id'] = serviceId;
    data['price'] = price;
    return data;
  }
}
