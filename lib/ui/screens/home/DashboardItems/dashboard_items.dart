import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/screens/simple_models/dashboardItem.dart';

class DashboardItems extends StatelessWidget {
  const DashboardItems({Key? key}) : super(key: key);

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
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( 
                          dashBoardItem.elementAt(index).title,
                          style: AppFonts.tinyBlue,
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          dashBoardItem.elementAt(index).subtitle,
                          style: AppFonts.bodyBlack,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: dashBoardItem.length);
          },
        )
      ],
    ),
  );
}
