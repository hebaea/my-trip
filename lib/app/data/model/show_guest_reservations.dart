class ReservationShowGuest {
  int? reservationId;
  int? guestId;
  int? destinationId;
  String? checkinDate;
  String? checkoutDate;
  String? status;
  int? total;

  ReservationShowGuest(
      {this.reservationId,
      this.guestId,
      this.destinationId,
      this.checkinDate,
      this.checkoutDate,
      this.status,
      this.total});

  ReservationShowGuest.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
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
    data['guest_id'] = guestId;
    data['destination_id'] = destinationId;
    data['Checkin_date'] = checkinDate;
    data['Checkout_date'] = checkoutDate;
    data['status'] = status;
    data['total'] = total;
    return data;
  }
}
