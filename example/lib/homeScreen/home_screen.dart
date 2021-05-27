import 'package:flutter/material.dart';
import 'package:wemapgl_example/constants.dart';
import 'package:wemapgl_example/ePage.dart';
import 'package:wemapgl_example/full_map.dart';
import 'package:wemapgl_example/route.dart';

final List<ePage> allTab = <ePage>[
  FullMapPage(),
  RoutePage(),
];

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
        ],
        onTap: onChosen,
      ),
    );
  }
}
