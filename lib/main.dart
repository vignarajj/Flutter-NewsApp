import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsListPage.dart';
import 'package:newsapp/viewmodel/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
