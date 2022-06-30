class FavoriteValidation {
  List<String>? guestId;
  List<String>? destinationId;

  FavoriteValidation({this.guestId, this.destinationId});

  FavoriteValidation.fromJson(Map<String, dynamic> json) {
    guestId = json['guest_id'].cast<String>();
    destinationId = json['destination_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest_id'] = guestId;
    data['destination_id'] = destinationId;
    return data;
  }
}
