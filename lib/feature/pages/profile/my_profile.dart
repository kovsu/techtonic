import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/common/utils/typography.dart';
import 'package:tech_tonic/common/utils/user.dart';
import 'package:tech_tonic/feature/content_page.dart';
import 'package:tech_tonic/feature/pages/home/my_card.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final String username = User.username;

  List articles = [];
  List talks = [];

  TextEditingController textController = TextEditingController();

  Future<void> fetchData() async {
    final resp = await Api.getArticlesById();
    final jsonResponse = jsonDecode(resp.body);

    setState(() {
      articles = jsonResponse['data'] as List;
      print(articles);
    });
  }

  Future<void> fetchData2() async {
    final resp = await Api.getTalksById();
    final jsonResponse = jsonDecode(resp.body);

    setState(() {
      talks = jsonResponse['data'] as List;
    });
  }

  int _currentIndex = 0;

  void _changeContent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData2();
  }

  @override
  Widget build(BuildContext context) {
    Widget showTag() {
      if (User.tag == '') {
        return TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('添加标签'),
                      content: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: '请输入标签名',
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('确定'),
                          onPressed: () {
                            // 执行确定操作
                            User.tag = textController.text;
                            Navigator.of(context).pop(); // 关闭弹窗
                          },
                        ),
                      ],
                    );
                  });
            },
            child: const Text("添加标签"));
      } else {
        return Text(User.tag);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(username, style: CustomTypography.h2), showTag()],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _changeContent(0);
                },
                child: const Text(
                  '所有文章',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _changeContent(1);
                },
                child: const Text(
                  '所有 talks',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          IndexedStack(
            index: _currentIndex,
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    var item = articles[index];
                    // 构建列表项
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
                    ;
                  },
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: talks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(talks[index]['content']),
                              Text(
                                talks[index]['time'],
                                style: CustomTypography.outline,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
