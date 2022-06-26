class GuestEmailValidation {
  List<String>? guestEmail;

  GuestEmailValidation({this.guestEmail});

  GuestEmailValidation.fromJson(Map<String, dynamic> json) {
    guestEmail = json['guest_email'].cast<String>();
    print("gest eamil ===== ${guestEmail?.first}");

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest_email'] = guestEmail;
    return data;
  }
}
