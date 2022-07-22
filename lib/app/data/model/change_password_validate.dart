class ChangePasswordValidate {
  List<String>? guestPassword;

  ChangePasswordValidate({this.guestPassword});

  ChangePasswordValidate.fromJson(Map<String, dynamic> json) {
    guestPassword = json['guest_password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guest_password'] = this.guestPassword;
    return data;
  }
}