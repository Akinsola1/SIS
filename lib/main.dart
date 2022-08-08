import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/screens/authentication/authScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.amber
      // ),
      debugShowCheckedModeBanner: false,
      routes: RouteNames.routes,
      initialRoute: RouteNames.authScreen,
      onGenerateRoute: RouteNames.generateRoute,
      navigatorKey: Get.key,
    );
  }
}
