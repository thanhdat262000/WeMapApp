import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wemapgl_example/api/auth.dart';
import 'package:wemapgl_example/authScreen/Login/components/background.dart';
import 'package:wemapgl_example/components/rounded_button.dart';
import 'package:wemapgl_example/components/rounded_input_field.dart';
import 'package:wemapgl_example/components/rounded_password_field.dart';
import 'package:wemapgl_example/components/already_have_an_account_check.dart';
import 'package:wemapgl_example/authScreen/Signup/signup_screen.dart';
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
  Map<String, String> formData = {'email': '', 'password': ''};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/login.svg',
            height: size.height * 0.35,
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedInputField(
                  hintText: "Your Email",
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
                  text: "LOGIN",
                  press: () {
                    if (formkey.currentState.validate()) {
                      logIn(formData).then((response) {
                        if (response.statusCode == 201) {
                          Navigator.pushNamed(context, '/homescreen');
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
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(press: () {
            Navigator.pushNamed(context, '/signup');
          })
        ],
      ),
    );
  }
}
