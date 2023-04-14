import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/typography.dart';

class ForumTalk extends StatelessWidget {
  final String content;
  final String time;
  final String username;
  final int comments;
  final VoidCallback onPressed;

  const ForumTalk(
      {super.key,
      required this.content,
      required this.time,
      required this.username,
      required this.comments,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(username, style: CustomTypography.h3),
                  const SizedBox(width: 5.0),
                  Text(
                    time,
                    style: CustomTypography.outline,
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(content),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  const Icon(Icons.comment_outlined, size: 12.0),
                  const SizedBox(width: 5.0),
                  Text(comments.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
