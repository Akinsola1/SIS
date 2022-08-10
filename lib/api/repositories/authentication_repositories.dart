import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/api/Authentication_api/authentication_api.dart';
import 'package:student_management/api/api_utils/network_exception.dart';
import 'package:student_management/api/data_models/auth_response/getStudentsResponse.dart';
import 'package:student_management/api/data_models/auth_response/getTeacherResponse.dart';
import 'package:student_management/api/data_models/auth_response/getUser_response.dart';
import 'package:student_management/api/data_models/auth_response/login_response.dart';
import 'package:student_management/api/data_models/auth_response/signupRespons.dart';
import 'package:student_management/locator.dart';
import 'package:student_management/ui/responsive_state.dart/base_view_model.dart';
import 'package:student_management/ui/responsive_state.dart/view_state.dart';

class AuthProvider extends BaseNotifier {
  var authApi = locator<AuthenticationApi>();
  GetUserResponse userData = GetUserResponse();
  List<GetStudentsResponse> studentList = [];
  List<GetStudentsResponse> searchResult = [];

  List<GetTeacherResponse> teacherList = [];

  Future<GetUserResponse> getUser() async {
    setState(ViewState.Busy);

    try {
      print("commencing signUp");
      userData = await authApi.fetchUserData();
      setState(ViewState.Idle);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", userData.id!);

      return userData;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return userData;
  }

  Future<bool> getStudentList() async {
    setState(ViewState.Busy);

    try {
      studentList = await authApi.getAllStudent();
      setState(ViewState.Idle);

      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> searchStudent(String parameter) async {
    setState(ViewState.Busy);

    try {
      searchResult = await authApi.searchStudent(parameter);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> getTeacherList() async {
    setState(ViewState.Busy);

    try {
      teacherList = await authApi.getAllTeacher();
      setState(ViewState.Idle);

      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> login(String adminName, String password) async {
    setState(ViewState.Busy);
    LoginResponse res = LoginResponse();

    try {
      print("commencing signUp");
      res = await authApi.login(
        adminName: adminName,
        password: password,
      );
      setState(ViewState.Idle);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", res.userId!);
      prefs.setString("token", res.token!);

      displayError(
          error: 'Login successfully', message: 'Always remember to logout ');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> signIn(String schoolName, String adminName, String phone,
      String password) async {
    setState(ViewState.Busy);
    SignUpModel res = SignUpModel();

    try {
      print("commencing signUp");
      res = await authApi.signUp(
        schoolName: schoolName,
        adminName: adminName,
        phone: phone,
        password: password,
      );
      setState(ViewState.Idle);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", res.data!.id!);
      displayError(
          error: 'Account created successfully',
          message: 'You can now create record for your school');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> addTeacher(
    String firstName,
    String lastName,
    String age,
    String gender,
  ) async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String schoolId = prefs.getString("id") ?? "";
    try {
      print("adding teacher");
      await authApi.addTeacher(
        firstName: firstName,
        lastName: lastName,
        age: age,
        gender: gender,
        schoolId: schoolId,
      );
      setState(ViewState.Idle);

      displayError(error: 'Teacher added successfully', message: '');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> addStudent(
    String fullname,
    String studentClass,
    String age,
    String state,
    String parentPhone,
    String parentName,
    String gender,
  ) async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String schoolId = prefs.getString("id") ?? "";
    try {
      print("adding student");
      await authApi.addStudent(
        fullname: fullname,
        studentClass: studentClass,
        age: age,
        state: state,
        parentPhone: parentPhone,
        parentName: parentName,
        gender: gender,
        schoolId: schoolId,
      );
      setState(ViewState.Idle);

      displayError(
          error: 'Student created successfully',
          message: 'You can now create record for your school');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  SnackbarController displayError(
      {required String error, required String message}) {
    SnackbarController controller = Get.snackbar(
      error,
      message,
      maxWidth: 300,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
    );
    return controller;
  }
}
