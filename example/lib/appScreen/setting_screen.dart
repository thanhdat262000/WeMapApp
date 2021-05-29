import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wemapgl_example/components/warning_dialog.dart';
import 'package:wemapgl_example/constants.dart';
import 'package:wemapgl_example/controller/user_controller.dart';

class SettingScreen extends GetWidget<UserController> {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png')),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: SvgPicture.asset("assets/icons/camera.svg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Obx(() => Text(
                    userController.userName.value,
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xFFF5F6F9),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return WarningDialog(
                          dialogTitle: "Log out",
                          dialogContent: "Do you want to log out?",
                          press: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        );
                      });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logout.svg',
                      color: kPrimaryColor,
                      width: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(child: Text('LOG OUT')),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
