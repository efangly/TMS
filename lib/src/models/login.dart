import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String token;
  String username;
  String display;

  Login({
    required this.token,
    required this.username,
    required this.display
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        username: json["username"],
        display: json["display"]
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "username": username,
        "display": display
      };
}
