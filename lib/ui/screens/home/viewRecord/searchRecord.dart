import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

import '../../../widgets/custom_dropdown.dart';

class SearchRecord extends StatefulWidget {
  const SearchRecord({Key? key}) : super(key: key);

  @override
  State<SearchRecord> createState() => _SearchRecordState();
}

class _SearchRecordState extends State<SearchRecord> {
  List<String> searchOption = ['Student', 'Teacher'];
  String selectedSearchOption = '';
  final TextEditingController searchParam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final authProv = Provider.of<AuthProvider>(context);
    var _userData = authProv.searchResult;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            CustomDropDown(
              options: searchOption.toList(),
              onChanged: (option) {
                setState(() {
                  selectedSearchOption = option;
                });
              },
              hintText: 'Category',
              fillColor: Colors.transparent,
              elevation: 2,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
              initialOption: selectedSearchOption,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              labelText: 'Enter search parameter',
              controller: searchParam,
            ),
            const SizedBox(
              height: 20,
            ),
            
            Center(
              child: ResponsiveState(
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
                          bool response =
                              await authProv.searchStudent(searchParam.text);
                        },
                        label: 'Search',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height:20,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _userData.length,
                itemBuilder: (context, index) {
                  var data = _userData.elementAt(index);
                  return _userData.isEmpty
                      ? Text(
                          'No record found',
                          style: AppFonts.bodyBlack,
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  index.toString(),
                                  style: AppFonts.tinyBlue,
                                ),
                                Text(
                                  data.fullname.toString(),
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
    );
  }
}
