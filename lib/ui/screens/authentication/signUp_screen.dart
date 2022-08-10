// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/nav.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController schoolName = TextEditingController();
  final TextEditingController adminName = TextEditingController();
  final TextEditingController adminPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: responsive.isMobile(context)
          ? size.width
          : responsive.isTablet(context)
              ? size.width / 2
              : size.width / 3,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create your school account',
                style: AppFonts.blueHeader,
              ),
              const Text(
                'Provide necessary information about your school. ',
                style: AppFonts.tinyBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(
                    labelText: 'School name',
                    hintText: 'school name',
                    controller: schoolName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelText: 'Admin name',
                    hintText: 'john',
                    controller: adminName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelText: 'Admin Phone number',
                    hintText: 'e.g +234,09031125',
                    controller: adminPhone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    hintText: '*********',
                    controller: password,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Having difficulties remembering your password?',
                    style: AppFonts.tinyBlue,
                  ),
                ],
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
                            bool response = await authProv.signIn(
                                schoolName.text,
                                adminName.text,
                                adminPhone.text,
                                password.text);

                            if (response) {
                              goTo(context: context, page: RouteNames.authScreen)
                                  .nav();
                            }
                          },
                          label: 'SignUp',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
