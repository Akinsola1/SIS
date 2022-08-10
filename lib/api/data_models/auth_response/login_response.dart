// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.success,
        this.token,
        this.userId,
    });

    bool ?success;
    String ?token;
    String ?userId;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        token: json["token"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "userId": userId,
    };
}
