import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/common/utils/typography.dart';

class ContentPage extends StatefulWidget {
  final String article_id;

  final String username;
  final String time;
  final String title;
  final String content;
  final String category;

  const ContentPage(
      {super.key,
      required this.username,
      required this.time,
      required this.title,
      required this.content,
      required this.category,
      required this.article_id});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  var _rate = 0;

  Future<void> fetchData() async {
    final resp = await Api.getRate(widget.article_id);
    final jsonResponse = jsonDecode(resp.body);

    setState(() {
      _rate = jsonResponse['data'][0]['rating'] ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    quill.QuillController _controller = quill.QuillController.basic();

    _controller = quill.QuillController(
      document: quill.Document.fromJson(
          jsonDecode(widget.content.replaceAll("\n", r'\n'))),
      selection: TextSelection.collapsed(offset: 0),
    );

    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: CustomTypography.h2,
              ),
              Row(
                children: [
                  Text(widget.username),
                  const SizedBox(width: 10),
                  Text(widget.time),
                  const SizedBox(width: 10),
                  Text(widget.category),
                ],
              ),
              RatingBar.builder(
                initialRating: _rate.toDouble(),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 15,
                onRatingUpdate: (rating) async {
                  await Api.rateArticle(widget.article_id, rating);
                },
              ),
              quill.QuillEditor.basic(
                controller: _controller,
                readOnly: true,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Go back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
