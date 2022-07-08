import 'package:dio/dio.dart';
import 'package:sicpa_assessment_flutter/core/error/exceptions.dart';
import 'package:sicpa_assessment_flutter/features/data/models/most_emailed_article_model.dart';
import 'package:sicpa_assessment_flutter/features/data/models/most_shared_article_model.dart';
import 'package:sicpa_assessment_flutter/features/data/models/most_viewed_article_model.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';
import 'package:sicpa_assessment_flutter/secrets.dart';

abstract class ArticleDataSource {
  Future<List<MostViewedArticle>>? getMostViewedArticles();

  Future<List<MostSharedArticle>>? getMostSharedArticles();

  Future<List<MostEmailedArticle>>? getMostEmailedArticles();
}

class ArticleDataSourceImpl implements ArticleDataSource {
  late final Dio dio;

  ArticleDataSourceImpl({required this.dio});

  @override
  Future<List<MostEmailedArticle>> getMostEmailedArticles() async {
    final dio = Dio(BaseOptions(
        baseUrl: 'https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=$apiKey'));
    final response = await dio
        .get('');

    if (response.statusCode == 200) {
      return MostEmailedArticleResponseModel.fromJson(response.data)
          .mostEmailedArticles;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<MostSharedArticle>> getMostSharedArticles() async {
    final response = await dio
        .get('https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=$apiKey');

    if (response.statusCode == 200) {
      return MostSharedArticleResponseModel.fromJson(response.data)
          .mostSharedArticles;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<MostViewedArticle>> getMostViewedArticles() async {
    final response = await dio
        .get('https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=$apiKey');

    if (response.statusCode == 200) {
      return MostViewedArticleResponseModel.fromJson(response.data)
          .mostViewedArticles;
    } else {
      throw ServerExceptions();
    }
  }
}
