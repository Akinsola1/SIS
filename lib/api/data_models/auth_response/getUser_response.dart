// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromJson(jsonString);

import 'dart:convert';

GetUserResponse getUserResponseFromJson(String str) => GetUserResponse.fromJson(json.decode(str));

String getUserResponseToJson(GetUserResponse data) => json.encode(data.toJson());

class GetUserResponse {
    GetUserResponse({
        this.id,
        this.schoolName,
        this.adminName,
    });

    String ?id;
    String ?schoolName;
    String ?adminName;

    factory GetUserResponse.fromJson(Map<String, dynamic> json) => GetUserResponse(
        id: json["_id"],
        schoolName: json["schoolName"],
        adminName: json["adminName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "schoolName": schoolName,
        "adminName": adminName,
    };
}
