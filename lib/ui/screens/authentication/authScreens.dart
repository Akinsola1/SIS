import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_management/ui/constant/appFonts.dart';
import 'package:student_management/ui/screens/authentication/signIn_screen.dart';
import 'package:student_management/ui/screens/authentication/signUp_screen.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String authType = 'Login';


  bool login = false;
  bool register = false;
  @override
  void initState() {
    login = true;
    register = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SIS',
                        style: AppFonts.blueHeader,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                authType = 'Login';
                                login = true;
                                register = false;
                              });
                            },
                            child: Text(
                              'Login',
                              style: login
                                  ? AppFonts.bodyBlue
                                  : AppFonts.bodyBlack,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authType = 'Register';
                                login = false;
                                register = true;
                              });
                            },
                            child: Text(
                              'Register',
                              style: register
                                  ? AppFonts.bodyBlue
                                  : AppFonts.bodyBlack,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                buldUi(authType),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  buldUi(String authType) {
    if (authType == 'Login') {
      return SignInScreen();
    } else {
      return SignUpScreen();
    }
  }
}
