import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:student_management/api/repositories/authentication_repositories.dart';
import 'package:student_management/ui/constant/appColors.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/constant/screen_routes.dart';
import 'package:student_management/ui/responsive_state.dart/responsive_state.dart';
import 'package:student_management/ui/responsiveness/responsive.dart';

import '../../widgets/widgetsExport.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
    final TextEditingController adminName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProv = Provider.of<AuthProvider>(context);


    return Column(
      children: [
        Container(
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
                  'Sign in',
                  style: AppFonts.blueHeader,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Admin Name',
                  hintText: 'Abj125',
                  controller: adminName,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: '*********',
                  obscureText: true,
                  controller: password,
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
                            bool response = await authProv.login(adminName.text, password.text);

                            if (response) {
                             Navigator.pushNamedAndRemoveUntil(context, RouteNames.dashBoard, (route) => false);
                            }
                          },
                          label: 'Login',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
