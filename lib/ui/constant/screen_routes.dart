import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/ui/screens/authentication/authScreens.dart';
import 'package:student_management/ui/screens/authentication/signIn_screen.dart';
import 'package:student_management/ui/screens/home/addStudent/add_student.dart';
import 'package:student_management/ui/screens/home/DashboardItems/dashboard.dart';
import 'package:student_management/ui/screens/home/add_teacher/add_teacher.dart';
import 'package:student_management/ui/screens/home/view_record/view_record.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String authScreen = 'authScreen';
  static const String completionScreen = 'completionScreen';
  static const String dashBoard = 'dashBoard';
  static const String addStudent = 'addStudent';
  static const String addTeacher = 'addTeacher';
  static const String viewRecord = 'viewRecord';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    authScreen: (context) => AuthScreen(),
    dashBoard: (context) => DashboardScreen(),
    addStudent: (context) => AddStudent(),
    addTeacher: (context) => AddTeacher(),
    viewRecord: (context) => ViewRecord(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case authScreen:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case dashBoard:
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      case addStudent:
        return MaterialPageRoute(builder: (context) => AddStudent());
      case addTeacher:
        return MaterialPageRoute(builder: (context) => AddTeacher());
      case viewRecord:
        return MaterialPageRoute(builder: (context) => ViewRecord());
      //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name));
    }
  }

  static Widget errorView(name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
