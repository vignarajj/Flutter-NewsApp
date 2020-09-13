import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsDetailsPage.dart';
import 'package:newsapp/viewmodel/newsArticleListViewModel.dart';
import 'package:newsapp/viewmodel/newsArticleViewModel.dart';
import 'package:newsapp/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsListPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateLatestNews();
  }

  _showNewsDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(
                  article: article,
                )));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Align(child: Text("No results found"));
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: vm.articles,
            onSelected: (article) {
              _showNewsDetails(context, article);
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Top news"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.searchNews(value);
              }
            },
            decoration: InputDecoration(
                labelText: "Enter the text",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    })),
          ),
          _buildList(context, vm),
        ],
      ),
    );
  }
}
