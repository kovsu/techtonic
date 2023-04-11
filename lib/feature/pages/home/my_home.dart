import 'package:flutter/material.dart';
import 'package:tech_tonic/feature/content_page.dart';
import 'package:tech_tonic/feature/pages/home/my_card.dart';
import 'package:tech_tonic/feature/pages/home/my_news.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> dataList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              // 点击事件处理逻辑
              print("object");
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Icon(Icons.search),
                  ),
                  Text('探索 TechTonic')
                ],
              ),
            )),
        const HomeNewsPage(),
        Expanded(
            child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            // final item = dataList[index];
            return HomeCustomCard(
              title: 'Flutter',
              subtitle:
                  'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContentPage(),
                  ),
                );
              },
            );
          },
        )),
      ],
    );
  }
}
