class CreateFavorite {
  int? guestId;
  int? destinationId;

  CreateFavorite({this.guestId, this.destinationId});

  CreateFavorite.fromJson(Map<String, dynamic> json) {
    guestId = json['guest_id'];
    destinationId = json['destination_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest_id'] = guestId;
    data['destination_id'] = destinationId;
    return data;
  }
}
