

import 'package:flutter/material.dart';

class goTo {
  // ignore: prefer_const_constructors_in_immutables
  final BuildContext context;
  final String page;
  goTo({Key? key, required this.context, required this.page});


  
  nav() {
    Navigator.pushNamed(
      context,
      page
    );
  }
}
