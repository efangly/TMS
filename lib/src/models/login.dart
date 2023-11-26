import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String token;
  String username;
  String userId;
  String firstname;
  String lastname;
  String job;
  String department;
  String status;

  Login({
    required this.token,
    required this.username,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.job,
    required this.department,
    required this.status,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        username: json["username"],
        userId: json["userID"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        job: json["job"],
        department: json["department"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "username": username,
        "userID": userId,
        "firstname": firstname,
        "lastname": lastname,
        "job": job,
        "department": department,
        "status": status,
      };
}
