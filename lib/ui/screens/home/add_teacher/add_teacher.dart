import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/custom_dropdown.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  List<String> classList = ["Math", "English", "Science", "Civic", "Government", "Economics"];
  String selectedClass = '';
  List<String> genderList = ["Male", "Female", "Binary"];
  String selectedGender = '';

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ))
              ],
            ),
            Text(
              'Create new teacher data',
              style: AppFonts.blueHeader,
            ),
            CustomTextField(
              labelText: 'First Name',
              controller: firstName,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Last Name',
              controller: lastName,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Age',
              controller: age,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
              options: genderList.toList(),
              onChanged: (option) {
                setState(() {
                  selectedGender = option;
                });
              },
              hintText: 'Gender',
              fillColor: Colors.transparent,
              elevation: 2,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
              initialOption: selectedGender,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
              options: classList.toList(),
              onChanged: (option) {
                setState(() {
                  selectedClass = option;
                });
              },
              hintText: 'Subject',
              fillColor: Colors.transparent,
              elevation: 2,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
              initialOption: selectedClass,
            ),
            const SizedBox(
              height: 30,
            ),
            ResponsiveState(
              state: authProv.state,
              busyWidget: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 6)),
              idleWidget: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () async {
                        bool response = await authProv.addTeacher(
                            firstName.text,
                            lastName.text,
                            age.text,
                            selectedGender);

                        if (response) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteNames.dashBoard, (route) => false);
                        }
                      },
                      label: 'Add Teacher',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
