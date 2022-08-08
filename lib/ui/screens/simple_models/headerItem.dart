import 'package:flutter/material.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  HeaderItem({this.isButton = false, required this.onTap, required this.title});
}

 