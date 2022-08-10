// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final VoidCallback onTap;
  final String subtitle;

  DashboardItem(this.title, this.onTap, this.subtitle);
}


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

