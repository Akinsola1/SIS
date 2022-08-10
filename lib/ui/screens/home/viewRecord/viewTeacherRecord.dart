import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class ViewTeacherRecord extends StatefulWidget {
  const ViewTeacherRecord({Key? key}) : super(key: key);

  @override
  State<ViewTeacherRecord> createState() => _ViewTeacherRecordState();
}

class _ViewTeacherRecordState extends State<ViewTeacherRecord> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final authProv = Provider.of<AuthProvider>(context, listen: false);
      authProv.getTeacherList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    var _userData = authProv.teacherList;
    return Center(
      child: ResponsiveState(
        state: authProv.state,
        busyWidget: const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(strokeWidth: 6)),
        idleWidget: Scaffold(
          body: _userData.isEmpty
              ? Center(
                  child: InkWell(
                    onTap: () {
                      goTo(context: context, page: RouteNames.addTeacher).nav();
                    },
                    child: Text(
                      'No Teacher added. Click here to add',
                      style: AppFonts.bodyBlue,
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                        'All Teacher Record',
                        style: AppFonts.bodyBlue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'S/N',
                            style: AppFonts.bodyBlue,
                          ),
                          Text(
                            'First name',
                            style: AppFonts.bodyBlue,
                          ),
                          Text(
                            'Last name',
                            style: AppFonts.bodyBlue,
                          ),
                          Text(
                            'age',
                            style: AppFonts.bodyBlue,
                          ),
                          Text(
                            'gender',
                            style: AppFonts.bodyBlue,
                          ),
                        ],
                      ),
                      Divider(),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _userData.length,
                          itemBuilder: (context, index) {
                            var data = _userData.elementAt(index);
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      index.toString(),
                                      style: AppFonts.tinyBlue,
                                    ),
                                    Text(
                                      data.firstname.toString(),
                                      style: AppFonts.tinyBlack,
                                    ),
                                    Text(
                                      data.lastname.toString(),
                                      style: AppFonts.tinyBlack,
                                    ),
                                    Text(
                                      data.age.toString(),
                                      style: AppFonts.tinyBlack,
                                    ),
                                    Text(
                                      data.gender.toString(),
                                      style: AppFonts.tinyBlack,
                                    ),
                                    // Text(
                                    //   data.id.toString(),
                                    //   style: AppFonts.tinyBlack,
                                    // ),
                                  ],
                                ),
                                Divider()
                              ],
                            );
                          }),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
