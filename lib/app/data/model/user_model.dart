import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  int? guestId;
  String? guestEmail;
  String? guestName;
  String? token;

  UserModel({this.guestId, this.guestEmail, this.guestName, this.token});

  // receiving data from server

  UserModel.fromJson(Map<String, dynamic> json) {
    guestId = json['guest_id'];
    guestEmail = json['guest_email'];
    guestName = json['guest_name'];
    token = json['token'];
  }

  // sending data to our server

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guest_id'] = this.guestId;
    data['guest_email'] = this.guestEmail;
    data['guest_name'] = this.guestName;
    data['token'] = this.token;
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
