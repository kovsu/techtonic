import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/coloors.dart';
import 'package:tech_tonic/feature/index.dart';

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
      home: const MyPage(),
      theme: ThemeData(
          scaffoldBackgroundColor: Coloors.background, fontFamily: 'Roboto'),
    );
  }
}
