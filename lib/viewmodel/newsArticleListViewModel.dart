import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservices.dart';
import 'package:newsapp/viewmodel/newsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> searchNews(String keyWord) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> news = await WebServices().fetchByKeyword(keyWord);
    this.articles = news.map((e) => NewsArticleViewModel(article: e)).toList();
    this.loadingStatus =
    this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateLatestNews() async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles = await WebServices().fetchLatestHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
