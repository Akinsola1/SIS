import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/custom_dropdown.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  List<String> levels = ["JSS1", "JSS2", "JSS3", "SS1", "SS2", "SS3"];
  String selectedLevel = '';
  List<String> genderList = ["Male", "Female", "Binary"];
  String selectedGender = '';
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController parentName = TextEditingController();
  final TextEditingController parentPhone = TextEditingController();
  final TextEditingController state = TextEditingController();
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
              'Create new student data',
              style: AppFonts.blueHeader,
            ),
            CustomTextField(
              labelText: 'Name',
              controller: name,
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
            CustomTextField(
              labelText: 'State of origin',
              controller: state,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Parent Name',
              controller: parentName,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Parent phone',
              controller: parentPhone,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
              options: levels.toList(),
              onChanged: (option) {
                setState(() {
                  selectedLevel = option;
                });
              },
              hintText: 'Class',
              fillColor: Colors.transparent,
              elevation: 2,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
              initialOption: selectedLevel,
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
                        bool response = await authProv.addStudent(
                            name.text,
                            selectedLevel,
                            age.text,
                            state.text,
                            parentPhone.text,
                            parentName.text,
                            selectedGender);

                        if (response) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteNames.dashBoard, (route) => false);
                        }
                      },
                      label: 'Add Student',
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
