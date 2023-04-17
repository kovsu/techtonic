import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'dart:convert' as convert;

import 'package:tech_tonic/common/utils/typography.dart';

class ContentScreen extends StatefulWidget {
  final int id;
  final String content;
  final List comments;
  final VoidCallback refresh;

  ContentScreen(
      {required this.id,
      required this.content,
      required this.comments,
      required this.refresh});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  String _talk = '';

  Widget _build() {
    if (widget.comments.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('暂无评论'),
      );
    } else {
      return Column(
        children: widget.comments.map((comment) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment['content']),
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(comment['username'], style: CustomTypography.h4),
                    const SizedBox(width: 8.0),
                    Text(comment['time']),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文章内容'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.content,
              style: CustomTypography.h2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '评论：',
              style: CustomTypography.h3,
            ),
          ),
          _build(),
          Center(
            child: Column(children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(labelText: 'Content'),
                  onChanged: (value) {
                    _talk = value.trim();
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    await Api.postTalkComment(widget.id, _talk);
                    widget.refresh();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: const Text('发布'))
            ]),
          )
        ],
      ),
    );
  }
}
