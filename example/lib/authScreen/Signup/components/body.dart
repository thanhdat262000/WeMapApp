import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wemapgl_example/authScreen/Login/login_screen.dart';
import 'package:wemapgl_example/authScreen/Signup/components/background.dart';
import 'package:wemapgl_example/components/already_have_an_account_check.dart';
import 'package:wemapgl_example/components/rounded_button.dart';
import 'package:wemapgl_example/components/rounded_input_field.dart';
import 'package:wemapgl_example/components/rounded_password_field.dart';
import 'package:wemapgl_example/utils/validation.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Your email",
                    onChanged: (value) {},
                    validatorFunc: emailValidator,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                    validatorFunc: passwordValidator,
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    press: () {},
                  ),
                ],
              )),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
