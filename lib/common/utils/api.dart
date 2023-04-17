import 'package:http/http.dart' as http;
import 'package:tech_tonic/common/utils/user.dart';

class Api {
  static const BASE_URL = 'http://localhost:3000';

  static const LOGIN = '$BASE_URL/login';
  static const REGISTER = '$BASE_URL/register';
  static const GET_TALKS = '$BASE_URL/getTalks';
  static const POST_TALK = '$BASE_URL/publishTalk';
  static const GET_TALK_BY_ID = '$BASE_URL/getTalkById';
  static const POST_TALK_COMMENT = '$BASE_URL/publishTalkComment';

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

  static Future<http.Response> getTalks(String page) async {
    final res = await http.get(Uri.parse(GET_TALKS).replace(
      queryParameters: {
        'page': page,
      },
    ));
    return res;
  }

  static Future<http.Response> getTalkById(String id) async {
    final res = await http.get(Uri.parse(GET_TALK_BY_ID).replace(
      queryParameters: {
        'id': id,
      },
    ));
    return res;
  }

  static Future<http.Response> postTalk(String content) async {
    final res = await http.post(
      Uri.parse(POST_TALK),
      body: {
        'user_id': User.id.toString(),
        'username': User.username,
        'content': content,
      },
    );
    return res;
  }

  static Future<http.Response> postTalkComment(int id, String content) async {
    final res = await http.post(
      Uri.parse(POST_TALK_COMMENT),
      body: {
        'talk_id': id.toString(),
        'user_id': User.id.toString(),
        'username': User.username,
        'content': content,
      },
    );
    return res;
  }
}
