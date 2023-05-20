import 'dart:ffi';

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
  static const CATEGROIES = '$BASE_URL/getCategories';
  static const publishArticle = '$BASE_URL/publishArticle';
  static const getArticle = '$BASE_URL/getArticles';
  static const getWebScraper = '$BASE_URL/webScraper';
  static const articlesById = '$BASE_URL/getArticlesById';
  static const talksById = '$BASE_URL/getTalksById';
  static const RATE_ARTICLE = '$BASE_URL/rateArticle';
  static const GET_RATE = '$BASE_URL/getRate';

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

  static Future<http.Response> postArticle(
      String title, String content, String category, String cover) async {
    final res = await http.post(Uri.parse(publishArticle), body: {
      'user_id': User.id.toString(),
      'username': User.username,
      'title': title,
      'content': content,
      'category': category,
      'cover': cover
    });
    return res;
  }

  static Future<http.Response> getCategories() async {
    final res = await http.get(Uri.parse(CATEGROIES));
    return res;
  }

  static Future<http.Response> getArticles() async {
    final res = await http.get(Uri.parse(getArticle));
    return res;
  }

  static Future<http.Response> webScraper() async {
    final res = await http.get(Uri.parse(getWebScraper));
    return res;
  }

  static Future<http.Response> getArticlesById() async {
    final res = await http.post(Uri.parse(articlesById), body: {
      'user_id': User.id.toString(),
    });
    return res;
  }

  static Future<http.Response> getTalksById() async {
    final res = await http.post(Uri.parse(talksById), body: {
      'user_id': User.id.toString(),
    });
    return res;
  }

  static Future<http.Response> rateArticle(
      String articleId, double rating) async {
    final res = await http.post(Uri.parse(RATE_ARTICLE), body: {
      'user_id': User.id.toString(),
      'article_id': articleId,
      'rating': rating.toDouble().toString(),
    });
    return res;
  }

  static Future<http.Response> getRate(String articleId) async {
    final res = await http.post(Uri.parse(GET_RATE), body: {
      'user_id': User.id.toString(),
      'article_id': articleId,
    });
    return res;
  }
}
