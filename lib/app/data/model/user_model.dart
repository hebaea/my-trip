import 'dart:convert';

UserModel userFromJson(String str) => UserModel.toObject(json.decode(str));

class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.toObject(Map<String, dynamic> json) => UserModel(
        user: User.toObject(json['guests']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "guests": user.toJson(),
        "token": token,
      };
}

class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.toObject(Map<String, dynamic> json) => User(
      id: json['guest_id'], name: json['guest_name'], email: json['guest_email']);

  Map<String, dynamic> toJson() => {
        "guest_id": id,
        "guest_name": name,
        "guest_email": email,
      };
}
