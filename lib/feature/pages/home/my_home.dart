import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/feature/content_page.dart';
import 'package:tech_tonic/feature/pages/home/my_card.dart';
import 'package:tech_tonic/feature/pages/home/my_news.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataList = [];

  Future<void> fetchData() async {
    final resp = await Api.getArticles();
    final jsonResponse = jsonDecode(resp.body);

    setState(() {
      dataList = jsonResponse['data'] as List;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
            final item = dataList[index];
            return HomeCustomCard(
              title: item['title'],
              cover: item['cover'],
              subtitle: item['subtitle'],
              username: item['username'],
              time: item['time'],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContentPage(
                        article_id: item['id'].toString(),
                        username: item['username'],
                        time: item['time'],
                        title: item['title'],
                        content: item['content'],
                        category: item['category']),
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
