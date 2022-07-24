class ReservationShow {
  List<Reservations>? reservations;

  ReservationShow({this.reservations});

  ReservationShow.fromJson(Map<String, dynamic> json) {
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reservations != null) {
      data['reservations'] = reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reservations {
  int? reservationId;
  String? destinationName;
  int? guestId;
  int? destinationId;
  String? checkinDate;
  String? checkoutDate;
  String? status;
  int? total;

  Reservations(
      {this.reservationId,
      this.destinationName,
      this.guestId,
      this.destinationId,
      this.checkinDate,
      this.checkoutDate,
      this.status,
      this.total});

  Reservations.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
    destinationName = json['destination_name'];
    guestId = json['guest_id'];
    destinationId = json['destination_id'];
    checkinDate = json['Checkin_date'];
    checkoutDate = json['Checkout_date'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reservation_id'] = reservationId;
    data['destination_name'] = destinationName;
    data['guest_id'] = guestId;
    data['destination_id'] = destinationId;
    data['Checkin_date'] = checkinDate;
    data['Checkout_date'] = checkoutDate;
    data['status'] = status;
    data['total'] = total;
    return data;
  }
}
