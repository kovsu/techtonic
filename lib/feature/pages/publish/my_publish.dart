import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class MyPublishPage extends StatefulWidget {
  const MyPublishPage({super.key});

  @override
  State<MyPublishPage> createState() => _MyPublishPageState();
}

class _MyPublishPageState extends State<MyPublishPage> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> data = jsonDecode(r'[{"insert": "Hello, world\n"}]');
    final quill.Delta delta = quill.Delta.fromJson(data);

    final quill.QuillController controller = quill.QuillController(
        document: quill.Document.fromDelta(delta),
        selection: const TextSelection.collapsed(offset: 0));

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
                        quill.QuillToolbar.basic(controller: controller),
                        quill.QuillEditor.basic(
                          controller: controller,
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
            print(controller.document.toDelta().toJson());
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.save),
        ));
  }
}
