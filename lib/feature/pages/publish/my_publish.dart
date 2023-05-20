import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:tech_tonic/common/utils/api.dart';
import 'dart:convert' as convert;

class MyPublishPage extends StatefulWidget {
  const MyPublishPage({super.key});

  @override
  State<MyPublishPage> createState() => _MyPublishPageState();
}

class _MyPublishPageState extends State<MyPublishPage> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _coverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    quill.QuillController _controller = quill.QuillController.basic();

    return Scaffold(
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        quill.QuillToolbar.basic(controller: _controller),
                        quill.QuillEditor.basic(
                          controller: _controller,
                          readOnly: false, // true for view only mode
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(labelText: '标题'),
                        ),
                        TextField(
                          controller: _coverController,
                          decoration: const InputDecoration(labelText: '封面'),
                        ),
                        TextField(
                          controller: _categoryController,
                          decoration: const InputDecoration(labelText: '类型'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await Api.postArticle(
                            _titleController.text,
                            jsonEncode(_controller.document.toDelta().toJson()),
                            _categoryController.text,
                            _coverController.text,
                          );
                          _titleController.text = '';
                          _categoryController.text = '';
                          _coverController.text = '';
                          _controller = quill.QuillController.basic();
                          Navigator.of(context).pop();
                        },
                        child: const Text('确定'),
                      ),
                    ],
                  );
                });
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.save),
        ));
  }
}
