// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        this.success,
        this.msg,
        this.data,
    });

    bool ?success;
    String ?msg;
    Data ?data;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.schoolName,
        this.adminName,
        this.phone,
        this.password,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String ?schoolName;
    String ?adminName;
    String ?phone;
    String ?password;
    String ?id;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        schoolName: json["schoolName"],
        adminName: json["adminName"],
        phone: json["phone"],
        password: json["password"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "schoolName": schoolName,
        "adminName": adminName,
        "phone": phone,
        "password": password,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
