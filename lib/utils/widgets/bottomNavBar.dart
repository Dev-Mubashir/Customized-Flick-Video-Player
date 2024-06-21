import 'package:flutter/material.dart';
import 'package:tamashaaa/screens/explore/explore_page.dart';
import 'package:tamashaaa/screens/home/view/home_page.dart';
import 'package:tamashaaa/screens/livetv/livetv_page.dart';
import 'package:tamashaaa/screens/more/more_page.dart';
import 'package:tamashaaa/screens/mylibrary/mylibrary_page.dart';
// import 'package:mmvideo_player1/screens/ShortVideoPlayer/my_logic/reels.dart';
// import 'package:mmvideo_player1/screens/default_player.dart';
// import 'package:mmvideo_player1/screens/Feed%20Player/feed_player.dart';
// import 'package:mmvideo_player1/screens/Landscape%20Player/landscape_player.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    LivetvPage(),
    ExplorePage(),
    MylibraryPage(),
    MorePage(),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 143, 143, 143),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
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
