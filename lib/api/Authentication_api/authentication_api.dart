



import 'package:student_management/api/data_models/api_response.dart';
import 'package:student_management/api/data_models/auth_response/getStudentsResponse.dart';
import 'package:student_management/api/data_models/auth_response/getTeacherResponse.dart';
import 'package:student_management/api/data_models/auth_response/getUser_response.dart';
import 'package:student_management/api/data_models/auth_response/login_response.dart';
import 'package:student_management/api/data_models/auth_response/signupRespons.dart';

abstract class AuthenticationApi {
   Future<LoginResponse> login({
    String adminName,
    String password,
  });

  Future<SignUpModel> signUp({
    String schoolName,
    String adminName,
    String phone,
    String password,
  });


  Future<ApiResponse> addStudent(
      {String fullname,
      String studentClass,
      String age,
      String state,
      String parentPhone,
      String parentName,
      String gender,
      String schoolId});

  Future<ApiResponse> addTeacher(
      {String firstName,
      String lastName,
      String age,
      String gender,
      String schoolId});

      Future<GetUserResponse> fetchUserData();
      Future<List<GetStudentsResponse>> getAllStudent();
      Future<List<GetTeacherResponse>> getAllTeacher();
      Future<List<GetStudentsResponse>>  searchStudent(String parameter);




  
} 