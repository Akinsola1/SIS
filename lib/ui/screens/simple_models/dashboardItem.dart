// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashboardItems {
  final String title;
  final VoidCallback onTap;
  final String subtitle;

  DashboardItems(this.title, this.onTap, this.subtitle);
}

List<DashboardItems> dashBoardItem = [
  DashboardItems("Total Student", () {}, "100"),
  DashboardItems("Session Income", () {}, " ₦1M"),
  DashboardItems("Total Teachers", () {}, "10")
];

class DashboardActivityModel {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  DashboardActivityModel({
    required this.title,
    required this.onTap,
    required this.icon,
  });
}

