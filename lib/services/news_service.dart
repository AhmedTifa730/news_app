import 'package:dio/dio.dart';
import 'package:news/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService( {required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
  Response response = await dio.get(
      'https://gnews.io/api/v4/top-headlines?category=$category&country=eg&apikey=aa89527c16c48c2d1c2b2d216e80a0a1');
  
  Map<String, dynamic> jsonData = response.data;
  
  List<dynamic> articles = jsonData['articles'];
  
  List<ArticleModel> articlesList = [];
  
  for (var article in articles) {
    ArticleModel articleModel = ArticleModel(
      image: article['image'],
      title: article['title'],
      subTitle: article['description'],
      url: article['url']
    );
    articlesList.add(articleModel);
  }
  
  return articlesList;
} catch (e) {
  return[];
}
  }
}
