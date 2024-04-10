import "package:femalert2/screens/community/community.dart";
import "package:femalert2/screens/home/home.dart";
import "package:femalert2/screens/map/map.dart";
import "package:femalert2/screens/tools/tools.dart";
import "package:femalert2/utils/colors.dart";
import "package:flutter/material.dart";
import 'package:boxicons/boxicons.dart';

class Raksha extends StatefulWidget {
  const Raksha({super.key});

  @override
  State<Raksha> createState() => _RakshaState();
}

class _RakshaState extends State<Raksha> {
  List pages = [
    HomeScreen(),
    const MapPage(),
    const Text("Bot"),
    const ToolsPage(),
    const CommunityPage(),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        iconSize: 28,
        selectedItemColor: ColorsValue.secondary,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Boxicons.bxs_home,
              color: ColorsValue.secondary,
            ),
            icon: Icon(
              Boxicons.bx_home,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Boxicons.bxs_map,
              color: ColorsValue.secondary,
            ),
            icon: Icon(
              Boxicons.bx_map,
              color: Colors.grey,
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Boxicons.bxs_bot,
              color: ColorsValue.secondary,
            ),
            icon: Icon(
              Boxicons.bx_bot,
              color: Colors.grey,
            ),
            label: "Bot",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Boxicons.bxs_shield,
              color: ColorsValue.secondary,
            ),
            icon: Icon(
              Boxicons.bx_shield,
              color: Colors.grey,
            ),
            label: "Tools",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Boxicons.bxs_group,
              color: ColorsValue.secondary,
            ),
            icon: Icon(
              Boxicons.bx_group,
              color: Colors.grey,
            ),
            label: "Community",
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    ));
  }
}
