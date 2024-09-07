import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('No news articles available.'),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(articleModel: article),
          );
        },
        childCount: articles.length,
      ),
    );
  }
}

