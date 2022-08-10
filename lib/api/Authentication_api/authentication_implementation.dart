import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/api/data_models/auth_response/getStudentsResponse.dart';
import 'package:student_management/api/data_models/auth_response/getTeacherResponse.dart';
import 'package:student_management/api/data_models/auth_response/getUser_response.dart';
import 'package:student_management/api/data_models/auth_response/login_response.dart';
import 'package:student_management/api/data_models/auth_response/signupRespons.dart';
import 'package:student_management/locator.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'authentication_api.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class AuthenticationApiImpl implements AuthenticationApi {
  
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Map<String, String> get mediaHeader => {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };
  // Map<String, String> get authHeader => {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${}',
  //     };
  var server = locator<API>();

  @override
  Future<LoginResponse> login({String? adminName, String? password}) async {
    Map val = {
      "adminName": adminName,
      "password": password,
    };
    var responsebody =
        await server.post(ApiRoutes.login, header, jsonEncode(val));
    LoginResponse response = loginResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<SignUpModel> signUp(
      {String? schoolName,
      String? adminName,
      String? phone,
      String? password}) async {
    Map val = {
      "schoolName": schoolName,
      "adminName": adminName,
      "phone": phone,
      "password": password
    };
    var responsebody =
        await server.post(ApiRoutes.signUp, header, jsonEncode(val));
    SignUpModel response = signUpModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> addStudent(
      {String? fullname,
      String? studentClass,
      String? age,
      String? state,
      String? parentPhone,
      String? parentName,
      String? gender,
      String? schoolId}) async {
    Map val = {
      "fullname": fullname,
      "class": studentClass,
      "age": age,
      "state": state,
      "parentPhone": parentPhone,
      "parentName": parentName,
      "gender": gender,
      "schoolId": schoolId,
    };
    var responsebody =
        await server.post(ApiRoutes.addStudent, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> addTeacher(
      {String? firstName,
      String? lastName,
      String? age,
      String? gender,
      String? schoolId}) async {
    Map val = {
      "firstname": firstName,
      "lastname": lastName,
      "age": age,
      "gender": gender,
      "schoolId": schoolId,
    };
    print(schoolId);
    var responsebody =
        await server.post(ApiRoutes.addTeacher, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }
  
  @override
  Future<GetUserResponse> fetchUserData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')??'' ;
    var responsebody =
        await server.get(ApiRoutes.userProfile, {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      });
    GetUserResponse response = getUserResponseFromJson(responsebody);
    return response;
  }
  
  @override
  Future<List<GetStudentsResponse>> getAllStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('id')??'' ;
    var responsebody =
        await server.get('https://stormy-falls-69167.herokuapp.com/api/students/${id}',header);
    List <GetStudentsResponse>response = getStudentsResponseFromJson(responsebody);
    return response;
  }
  
  @override
  Future<List<GetTeacherResponse>> getAllTeacher() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('id')??'' ;
    var responsebody =
        await server.get('https://stormy-falls-69167.herokuapp.com/api/teachers/${id}',header);
    List <GetTeacherResponse>response = getTeacherResponseFromJson(responsebody);
    return response;
  }
  
  @override
  Future<List<GetStudentsResponse>>  searchStudent(String parameter) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String id = prefs.getString('id')??'' ;
    var responsebody =
        await server.get('https://stormy-falls-69167.herokuapp.com/api/search/$parameter',header);
    List <GetStudentsResponse>response = getStudentsResponseFromJson(responsebody);
    return response;
  }
}

// String? first_name,
//     String? last_name,
//     String? email,
//     String? password,
//     String? category,
//     String? phoneNumber,
//     String? city,
//     String? state,
//     String? pharmacy,

