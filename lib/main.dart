import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/coloors.dart';
import 'package:tech_tonic/feature/index.dart';
import 'package:tech_tonic/feature/pages/login/my_login.dart';

import 'feature/pages/home/my_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTonic',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const MyLoginPage(),
        '/index': (context) => const MyPage(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Coloors.background, fontFamily: 'Roboto'),
    );
  }
}
