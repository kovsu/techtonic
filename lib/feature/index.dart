import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tech_tonic/feature/pages/finds/my_finds.dart';
import 'package:tech_tonic/feature/pages/forum/my_forum.dart';
import 'package:tech_tonic/feature/pages/home/my_home.dart';
import 'package:tech_tonic/feature/pages/publish/my_publish.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List allPages = <Widget>[
    const MyHomePage(),
    const MyForumPage(),
    const MyPublishPage(),
    const MyFindsPage(),
    const Text('People'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.forum, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
          Icon(Icons.people, size: 30, color: Colors.white),
        ],
        height: 60.0,
        backgroundColor: Colors.transparent,
        color: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
