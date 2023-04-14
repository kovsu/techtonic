import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/typography.dart';
import 'package:tech_tonic/feature/pages/forum/my_talks.dart';

class MyForumPage extends StatefulWidget {
  const MyForumPage({super.key});

  @override
  State<MyForumPage> createState() => _MyForumPageState();
}

class _MyForumPageState extends State<MyForumPage> {
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
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ForumTalk(
                    content: "content",
                    time: "time",
                    username: "username",
                    comments: 0,
                    onPressed: () {},
                  );
                },
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add),
        ));
  }
}
