// To parse this JSON data, do
//
//     final getStudentsResponse = getStudentsResponseFromJson(jsonString);

import 'dart:convert';

List<GetStudentsResponse> getStudentsResponseFromJson(String str) => List<GetStudentsResponse>.from(json.decode(str).map((x) => GetStudentsResponse.fromJson(x)));

String getStudentsResponseToJson(List<GetStudentsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentsResponse {
    GetStudentsResponse({
        this.id,
        this.fullname,
        this.getStudentsResponseClass,
        this.age,
        this.state,
        this.parentPhone,
        this.parentName,
        this.gender,
        this.schoolId,
        this.v,
    });

    String ? id;
    String ? fullname;
    String ? getStudentsResponseClass;
    int ?age;
    String ? state;
    String ? parentPhone;
    String ? parentName;
    String ? gender;
    String ? schoolId;
    int? v;

    factory GetStudentsResponse.fromJson(Map<String, dynamic> json) => GetStudentsResponse(
        id: json["_id"],
        fullname: json["fullname"],
        getStudentsResponseClass: json["class"],
        age: json["age"],
        state: json["state"],
        parentPhone: json["parentPhone"],
        parentName: json["parentName"],
        gender: json["gender"],
        schoolId: json["schoolId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "class": getStudentsResponseClass,
        "age": age,
        "state": state,
        "parentPhone": parentPhone,
        "parentName": parentName,
        "gender": gender,
        "schoolId": schoolId,
        "__v": v,
    };
}
