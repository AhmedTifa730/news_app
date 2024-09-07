import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        // Check if data is loaded successfully
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        }
        // If there's an error, show an error message
        else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Oops! There was an error, please try again later'),
            ),
          );
        }
        else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

        
    //   return isLoading
    //       ? const SliverToBoxAdapter(
    //           child: Center(
    //           child: CircularProgressIndicator(),
    //         ))
    //       :articles.isNotEmpty ? NewsListView(
    //           articles: articles,
    //         ) : const SliverToBoxAdapter(
    //           child: Text('oops there was an error , please try again later'),
    //         ) ;
 
