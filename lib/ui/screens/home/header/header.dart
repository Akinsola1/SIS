import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/api/data_models/auth_response/getUser_response.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
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
  final authProv = Provider.of<AuthProvider>(context);
  var _userData =  authProv.userData;
  return SafeArea(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello ${_userData.adminName}',
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
