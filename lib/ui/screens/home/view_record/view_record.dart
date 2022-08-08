import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_management/ui/constant/appFonts.dart';

class ViewRecord extends StatelessWidget {
  const ViewRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text(
          'Unablle to quary record at the moment',
          style: AppFonts.bodyBlack,
        ),
      ),
    );
  }
}