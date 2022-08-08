import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/global.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/screens/home/DashboardItems/dashboard_activity.dart';
import 'package:student_management/ui/screens/home/DashboardItems/dashboard_items.dart';
import 'package:student_management/ui/screens/home/header/header.dart';
import 'package:student_management/ui/screens/simple_models/headerItem.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    List<HeaderItem> headerItem = [
      HeaderItem(onTap: () {}, title: "SOMETHING"),
      HeaderItem(onTap: () {}, title: "NOTIFICATION"),
      HeaderItem(onTap: () {}, title: "SETTING"),
      HeaderItem(onTap: () {}, title: "SKILLS"),
      HeaderItem(
          onTap: () {
            goTo(context: context, page: RouteNames.addStudent).nav();
          },
          title: "ADD STUDENT",
          isButton: true),
    ];
    return Scaffold(
        key: Global.scaffoldKey,
        endDrawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return headerItem.elementAt(index).isButton
                        ? MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              child: TextButton(
                                onPressed: headerItem.elementAt(index).onTap,
                                child: Text(
                                  headerItem.elementAt(index).title,
                                  style: AppFonts.bodyBlack,
                                ),
                              ),
                            ),
                          )
                        : ListTile(
                            title: Text(headerItem[index].title,
                                style: AppFonts.bodyBlack));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox();
                  },
                  itemCount: headerItem.length),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Header(),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: DashboardItems(),
              ),
              DashboardActivity()
            ],
          ),
        ));
  }
}
