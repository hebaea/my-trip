class HotelReservation {
  List<Rooms>? rooms;
  List<Services>? services;

  HotelReservation({this.rooms, this.services});

  HotelReservation.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
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
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? roomId;
  String? roomType;
  int? roomPrice;

  Rooms(
      {required this.roomId, required this.roomType, required this.roomPrice});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    roomType = json['room_type'];
    roomPrice = json['room_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['room_type'] = roomType;
    data['room_price'] = roomPrice;
    return data;
  }
}

class Services {
  int? serviceId;
  String? serviceName;
  int? servicePrice;

  Services(
      {required this.serviceId,
      required this.serviceName,
      required this.servicePrice});

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
