import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:location/location.dart';
import 'package:wemapgl_example/authScreen/Login/login_screen.dart';
import 'package:wemapgl_example/authScreen/Signup/signup_screen.dart';
import 'package:wemapgl_example/authScreen/Welcome/welcome_screen.dart';
import 'package:wemapgl_example/constants.dart';
import 'package:wemapgl_example/appScreen/home_screen.dart';

import 'package:wemapgl/wemapgl.dart' as WEMAP;

void main() {
  WEMAP.Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');
  // runApp(MaterialApp(home: MapsDemo()));
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Auth Screen',
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => WelcomeScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/signup', page: () => SignUpScreen()),
      GetPage(name: '/homescreen', page: () => HomeScreen()),
    ],
    theme: ThemeData(
        primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
  ));
}
