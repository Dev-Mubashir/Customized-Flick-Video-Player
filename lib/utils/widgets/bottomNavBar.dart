import 'package:flutter/material.dart';
import 'package:tamashaaa/screens/explore/explore_page.dart';
import 'package:tamashaaa/screens/home/view/home_page.dart';
import 'package:tamashaaa/screens/livetv/livetv_page.dart';
import 'package:tamashaaa/screens/more/more_page.dart';
import 'package:tamashaaa/screens/mylibrary/mylibrary_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const LivetvPage(),
    const ExplorePage(),
    const MylibraryPage(),
    const MorePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 143, 143, 143),
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        iconSize: 22, // Adjust icon size to maintain consistency
        selectedFontSize: 9, // Ensure the font size does not change
        unselectedFontSize: 9, // Ensure the font size does not change
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Live TV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'My Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
