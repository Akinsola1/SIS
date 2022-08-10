import 'package:flutter/material.dart';
import 'package:student_management/ui/constant/appColors.dart';

class AppFonts {
  static const blueHeader = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 24,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.bold);
  static const blackHeader = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.bold);

  static const bodyBlack = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);
  static const bodyBlue = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);

  static const bodyWhite = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);

  static final hintText = TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontSize: 13,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);

  static const tinyBlue = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 12,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);
  static const tinyBlack = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'urbanist',
      fontWeight: FontWeight.w400);
}
