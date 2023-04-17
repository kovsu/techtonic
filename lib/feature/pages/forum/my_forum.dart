import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/common/utils/typography.dart';
import 'package:tech_tonic/feature/pages/forum/my_talk.dart';
import 'package:tech_tonic/feature/pages/forum/my_talks.dart';
import 'dart:convert' as convert;

class MyForumPage extends StatefulWidget {
  const MyForumPage({super.key});

  @override
  State<MyForumPage> createState() => _MyForumPageState();
}

class _MyForumPageState extends State<MyForumPage> {
  String _content = '';
  var _talks = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final resp = await Api.getTalks('1');

    var jsonResponse = convert.jsonDecode(resp.body) as Map<String, dynamic>;
    setState(() {
      _talks = jsonResponse['data'] as List;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "每日 Talks",
                  style: CustomTypography.h2,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: _talks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ForumTalk(
                      content: _talks[index]['content'],
                      time: _talks[index]['time'],
                      username: _talks[index]['username'],
                      comments: _talks[index]['comments'].length,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentScreen(
                                id: _talks[index]['id'],
                                content: _talks[index]['content'],
                                comments: _talks[index]['comments'],
                                refresh: _getData),
                          ),
                        );
                      });
                },
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // ignore: use_build_context_synchronously
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Column(children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          maxLines: null,
                          decoration:
                              const InputDecoration(labelText: 'Content'),
                          onChanged: (value) {
                            _content = value.trim();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () async {
                            await Api.postTalk(_content);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                          child: const Text('发布'))
                    ]),
                  );
                });
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add),
        ));
  }
}
