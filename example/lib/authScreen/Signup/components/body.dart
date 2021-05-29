import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wemapgl_example/api/auth.dart';
import 'package:wemapgl_example/authScreen/Login/login_screen.dart';
import 'package:wemapgl_example/authScreen/Signup/components/background.dart';
import 'package:wemapgl_example/components/already_have_an_account_check.dart';
import 'package:wemapgl_example/components/rounded_button.dart';
import 'package:wemapgl_example/components/rounded_input_field.dart';
import 'package:wemapgl_example/components/rounded_password_field.dart';
import 'package:wemapgl_example/controller/user_controller.dart';
import 'package:wemapgl_example/utils/user.dart';
import 'package:wemapgl_example/utils/validation.dart';
import 'package:wemapgl_example/components/auth_dialog.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Map<String, String> formData = {'name': "", 'email': '', 'password': ''};
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.35,
          ),
          Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInputField(
                    hintText: "Your Name",
                    icon: Icons.account_circle,
                    onChanged: (value) {
                      setState(() {
                        formData['name'] = value;
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "Your email",
                    onChanged: (value) {
                      setState(() {
                        formData['email'] = value;
                      });
                    },
                    validatorFunc: emailValidator,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      setState(() {
                        formData['password'] = value;
                      });
                    },
                    validatorFunc: passwordValidator,
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    press: () {
                      if (formkey.currentState.validate()) {
                        signUp(formData).then((response) {
                          if (response.statusCode == 201) {
                            Get.toNamed('/homescreen');
                            var data = jsonDecode(response.body);
                            userController.setUserName(data['account']['name']);
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AuthDialog(
                                    dialogTitle: "Error",
                                    dialogContent:
                                        jsonDecode(response.body)['message'],
                                  );
                                },
                                barrierDismissible: true);
                          }
                        }).error((error) {
                          print(error);
                        });
                      }
                    },
                  ),
                ],
              )),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Get.toNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
