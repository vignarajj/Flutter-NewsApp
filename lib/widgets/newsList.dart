import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsDetailsPage.dart';
import 'package:newsapp/viewmodel/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel vm) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              onSelected(article);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imageUrl == null
                    ? Image.asset('placeholder_image.png')
                    : Image.network(article.imageUrl)),
            title: Text(article.title),
          );
        });
  }
}
