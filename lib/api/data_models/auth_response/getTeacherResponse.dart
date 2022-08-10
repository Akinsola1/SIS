// To parse this JSON data, do
//
//     final getTeacherResponse = getTeacherResponseFromJson(jsonString);

import 'dart:convert';

List<GetTeacherResponse> getTeacherResponseFromJson(String str) => List<GetTeacherResponse>.from(json.decode(str).map((x) => GetTeacherResponse.fromJson(x)));

String getTeacherResponseToJson(List<GetTeacherResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTeacherResponse {
    GetTeacherResponse({
        this.id,
        this.firstname,
        this.lastname,
        this.gender,
        this.age,
        this.schoolId,
        this.v,
    });

    String ? id;
    String ? firstname;
    String ? lastname;
    String ? gender;
    int ?age;
    String ?schoolId;
    int ?v;

    factory GetTeacherResponse.fromJson(Map<String, dynamic> json) => GetTeacherResponse(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        age: json["age"],
        schoolId: json["schoolId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "age": age,
        "schoolId": schoolId,
        "__v": v,
    };
}
