import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/screens/simple_models/dashboardItem.dart';

class DashboardActivity extends StatelessWidget {
  const DashboardActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: responsive(
        mobile: _buildUi(context, MediaQuery.of(context).size.width * .8),
        tablet: _buildUi(context, 760),
        desktop: _buildUi(context, 1000),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  List<DashboardActivityModel> dashBoardActivity = [
    DashboardActivityModel(
        title: "Add Students",
        onTap: () {
          goTo(context: context, page: RouteNames.addStudent).nav();
        },
        icon: Icons.school),
    DashboardActivityModel(
        title: "Add Teacher",
        onTap: () {
          goTo(context: context, page: RouteNames.addTeacher).nav();
        },
        icon: Icons.person),
    DashboardActivityModel(
        title: "View Record", onTap: () {
          goTo(context: context, page: RouteNames.viewRecord).nav();

        }, icon: Icons.remove_red_eye),

    
  ];
  return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: false,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (_context, constraint) {
            return ResponsiveGridView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: responsive.isTablet(context) ||
                            responsive.isMobile(context)
                        ? constraint.maxWidth / 3
                        : 250,
                    childAspectRatio: responsive.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: dashBoardActivity.elementAt(index).onTap,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dashBoardActivity.elementAt(index).title,
                            style: AppFonts.tinyBlack,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            dashBoardActivity.elementAt(index).icon,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: dashBoardActivity.length);
          },
        )
      ],
    ),
  );
}
