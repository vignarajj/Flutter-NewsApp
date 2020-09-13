import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/utils/constants.dart';

class WebServices {
  Future<List<NewsArticle>> fetchByKeyword(String keyWord) async {
    final response = await http.get(Constants.headLinesFor(keyWord));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Unable to fetch the news");
    }
  }

  Future<List<NewsArticle>> fetchLatestHeadlines() async {
    final response = await http.get(Constants.topHeadLinesUrl);
    if (response.statusCode == 200) {
      final newsList = jsonDecode(response.body);
      Iterable list = newsList["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Unable to fetch the news");
    }
  }
}
