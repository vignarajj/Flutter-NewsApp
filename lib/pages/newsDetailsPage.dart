import 'package:flutter/material.dart';
import 'package:newsapp/viewmodel/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatefulWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsPage({this.article});

  @override
  _NewsArticleDetailsPageState createState() => _NewsArticleDetailsPageState();
}

class _NewsArticleDetailsPageState extends State<NewsArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.article.url,
        ),
      ),
    );
  }
}
