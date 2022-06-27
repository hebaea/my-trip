import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  int? guestId;
  String? guestEmail;
  String? guestName;
  String? token;
  String? password;

  UserModel(
      {this.guestId,
      this.guestEmail,
      this.guestName,
      this.token,
      this.password});

  // receiving data from server

  UserModel.fromJson(Map<String, dynamic> json) {
    guestId = json['guest_id'];
    guestEmail = json['guest_email'];
    guestName = json['guest_name'];
    token = json['token'];
    password = json['guest_password'];
  }

  // sending data to our server

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest_id'] = guestId;
    data['guest_email'] = guestEmail;
    data['guest_name'] = guestName;
    data['token'] = token;
    data['guest_password'] = password;
    return data;
  }
}
