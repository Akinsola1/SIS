import 'package:flutter/material.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/global.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/screens/simple_models/headerItem.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: responsive(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: buildHeader(context),
        ),
        tablet: buildHeader(context),
        mobile: buildMobileHeader(context),
      ),
    );
  }
}

Widget buildMobileHeader(context) {
  return SafeArea(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello Admin',
          style: AppFonts.blueHeader,
        ),
        GestureDetector(
          onTap: () {
            Global.scaffoldKey.currentState!.openEndDrawer();
          },
          child: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
            size: 28,
          ),
        )
      ],
    ),
  ));
}

Widget buildHeader(context) {
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
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello Admin',
            style: AppFonts.blueHeader,
          ),
          Row(
            children: headerItem
                .map(
                  (item) => item.isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: TextButton(
                              onPressed: item.onTap,
                              child: Text(
                                item.title,
                                style: AppFonts.bodyWhite,
                              ),
                            ),
                          ),
                        )
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: GestureDetector(
                              onTap: item.onTap,
                              child: Text(item.title, style: AppFonts.tinyBlue),
                            ),
                          ),
                        ),
                )
                .toList(),
          ),
        ],
      ));
}
