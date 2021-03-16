import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.name,
    this.myclass,
    this.email,
    this.mobile,
    this.createdAt,
    this.v,
    this.resetPasswordExpire,
    this.resetPasswordToken,
  });

  String id;
  String name;
  String myclass;
  String email;
  String mobile;
  DateTime createdAt;
  int v;
  String resetPasswordExpire;
  String resetPasswordToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        myclass: json["class"],
        email: json["email"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        resetPasswordExpire: json["resetPasswordExpire"],
        resetPasswordToken: json["resetPasswordToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "class": myclass,
        "email": email,
        "mobile": mobile,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "resetPasswordExpire": resetPasswordExpire,
        "resetPasswordToken": resetPasswordToken,
      };
}
