class UpdateValidation {
  List<String>? guestName;
  List<String>? guestEmail;

  UpdateValidation({this.guestName, this.guestEmail});

  UpdateValidation.fromJson(Map<String, dynamic> json) {
    guestName = json['guest_name'].cast<String>();
    guestEmail = json['guest_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest_name'] = guestName;
    data['guest_email'] = guestEmail;
    return data;
  }
}
