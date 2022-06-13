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
//
// class UserModel {
//   User user;
//   // String token;
//
//   UserModel({required this.user,
//     // required this.token
//   });
//
//   factory UserModel.toObject(Map<String, dynamic> json) => UserModel(
//         user: User.toObject(json['guests']),
//         // token: json['token'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "guests": user.toJson(),
//         // "token": token,
//       };
// }
//
// class User {
//   int id;
//   String name;
//   String email;
//
//   User({required this.id, required this.name, required this.email});
//
//   factory User.toObject(Map<String, dynamic> json) => User(
//       id: json['guest_id'], name: json['guest_name'], email: json['guest_email']);
//
//   Map<String, dynamic> toJson() => {
//         "guest_id": id,
//         "guest_name": name,
//         "guest_email": email,
//       };
// }
