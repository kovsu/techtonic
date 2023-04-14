import 'package:http/http.dart' as http;

class Api {
  static const BASE_URL = 'http://localhost:3000';

  static const LOGIN = '$BASE_URL/login';
  static const REGISTER = '$BASE_URL/register';

  static Future<http.Response> login(String email, String password) async {
    final res = await http.post(
      Uri.parse(LOGIN),
      body: {
        'email': email,
        'password': password,
      },
    );
    return res;
  }

  static Future<http.Response> register(
      String email, String password, String name) async {
    final res = await http.post(
      Uri.parse(REGISTER),
      body: {
        'email': email,
        'password': password,
        'name': name,
      },
    );
    return res;
  }
}
