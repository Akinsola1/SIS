import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/global.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
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
  void initState() {
    Future.delayed(Duration.zero, () {
      final authProv = Provider.of<AuthProvider>(context, listen: false);
      authProv.getUser();
      authProv.getStudentList();
      authProv.getTeacherList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);

    List<HeaderItem> headerItem = [
      HeaderItem(onTap: () {}, title: "NOTIFICATION"),
      HeaderItem(onTap: () {}, title: "SETTING"),
      HeaderItem(onTap: () {}, title: "SKILLS"),
      HeaderItem(
          onTap: () async {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.authScreen, (route) => false);
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.clear();
          },
          title: "SIGN OUT"),
      HeaderItem(
          onTap: () {
            goTo(context: context, page: RouteNames.addStudent).nav();
          },
          title: "ADD STUDENT",
          isButton: true),
    ];
    return Center(
      child: ResponsiveState(
          state: authProv.state,
          busyWidget: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
          idleWidget: Scaffold(
              key: Global.scaffoldKey,
              endDrawer: Drawer(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28),
                                    child: TextButton(
                                      onPressed:
                                          headerItem.elementAt(index).onTap,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
              ))),
    );
  }
}
