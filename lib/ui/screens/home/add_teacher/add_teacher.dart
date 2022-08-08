import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/custom_dropdown.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  List<String> classList = ["JSS1", "JSS2", "JSS3", "SS1", "SS2", "SS3"];
  String selectedClass = '';


  @override
  Widget build(BuildContext context) {
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
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Last Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Age',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'sex',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
              options:classList. toList(),
              onChanged: (option) {
                setState(() {
                  selectedClass = option;
                });
              },
              hintText: 'Class',
              fillColor: Colors.transparent,
              elevation: 2,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
              initialOption: selectedClass,
            ),
            
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: responsive.isMobile(context) ? size.width : size.width / 2,
              child: CustomButton(
                onTap: () {},
                label: 'Add',
              ),
            )
          ],
        ),
      ),
    );
  }
}
