import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/common/utils/user.dart';
import 'dart:convert' as convert;

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value.trim();
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  _password = value.trim();
                },
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('登录'),
                    onPressed: () async {
                      var res = await Api.login(_email, _password);
                      if (res.statusCode == 200) {
                        var jsonResponse = convert.jsonDecode(res.body)
                            as Map<String, dynamic>;
                        User.username = jsonResponse['data']['username'];
                        User.email = jsonResponse['data']['email'];
                        User.id = jsonResponse['data']['id'];
                        User.tag = jsonResponse['data']['tag'] ?? '';

                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/index');
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('登录失败'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    child: const Text('注册'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('输入用户名'),
                              content: TextFormField(
                                controller: _nameController,
                              ),
                              actions: [
                                ElevatedButton(
                                  child: const Text('确定'),
                                  onPressed: () async {
                                    // 在这里处理用户输入的文本
                                    var res = await Api.register(_email,
                                        _password, _nameController.text);

                                    if (res.statusCode == 200) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('注册成功'),
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('注册失败'),
                                          backgroundColor: Colors.redAccent,
                                        ),
                                      );
                                    }

                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
