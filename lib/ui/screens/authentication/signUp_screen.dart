// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';
import 'package:student_management/ui/widgets/widgetsExport.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              CustomTextField(
                labelText: 'School name',
                hintText: 'school name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Admin name',
                hintText: 'john',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: ' create Password',
                hintText: '*********',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Confirm Password',
                hintText: '*********',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Having difficulties remembering your password?',
                style: AppFonts.tinyBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.dashBoard);
                          },
                          label: 'Sign Up')),
                ],
              )
            ],
          )),
    );
  }
}
