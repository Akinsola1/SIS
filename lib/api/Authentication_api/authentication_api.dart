



import 'package:student_management/api/data_models/auth_response/login_response.dart';

abstract class AuthenticationApi {
   Future<LoginResponse> login({
    String email,
    String password,
  });

  
} 