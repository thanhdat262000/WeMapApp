import 'package:flutter/material.dart';
import 'package:wemapgl_example/appScreen/setting_screen.dart';
import 'package:wemapgl_example/appScreen/full_map.dart';
import 'package:wemapgl_example/appScreen/route.dart';
import 'package:wemapgl_example/constants.dart';

final List allTab = [FullMapPage(), RoutePage(), SettingScreen()];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void onChosen(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allTab[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: kPrimaryLightColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Bản đồ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle),
            label: "Dẫn đường",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Cài đặt")
        ],
        onTap: onChosen,
      ),
    );
  }
}
