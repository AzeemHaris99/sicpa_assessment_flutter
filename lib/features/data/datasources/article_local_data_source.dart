import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';
import 'package:sicpa_assessment_flutter/main.dart';

abstract class ArticleLocalDataSource {
  Future<List<MostViewedArticle>>? cacheMostViewedArticles(
      List<MostViewedArticle> remoteMostViewedArticles);

  Future<List<MostSharedArticle>>? cacheMostSharedArticles(
      List<MostSharedArticle> remoteMostSharedArticles);

  Future<List<MostEmailedArticle>>? cacheMostEmailedArticles(
      List<MostEmailedArticle> remoteMostEmailedArticles);

  Future<List<MostViewedArticle>>? getMostViewedArticles();

  Future<List<MostSharedArticle>>? getMostSharedArticles();

  Future<List<MostEmailedArticle>>? getMostEmailedArticles();
}

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  @override
  Future<List<MostEmailedArticle>>? cacheMostEmailedArticles(
      List<MostEmailedArticle> remoteMostEmailedArticles) async {
    await mostEmailedArticleBox?.addAll(remoteMostEmailedArticles);
    return remoteMostEmailedArticles;
  }

  @override
  Future<List<MostSharedArticle>>? cacheMostSharedArticles(
      List<MostSharedArticle> remoteMostSharedArticles) async {
    await mostSharedArticleBox?.addAll(remoteMostSharedArticles);
    return remoteMostSharedArticles;
  }

  @override
  Future<List<MostViewedArticle>>? cacheMostViewedArticles(
      List<MostViewedArticle> remoteMostViewedArticles) async {
    await mostViewedArticleBox?.addAll(remoteMostViewedArticles);
    return remoteMostViewedArticles;
  }

  @override
  Future<List<MostEmailedArticle>>? getMostEmailedArticles() {
    return Future.value(
        mostEmailedArticleBox?.values.toList() as List<MostEmailedArticle>);
  }

  @override
  Future<List<MostSharedArticle>>? getMostSharedArticles() {
    return Future.value(
        mostSharedArticleBox?.values.toList() as List<MostSharedArticle>);
  }

  @override
  Future<List<MostViewedArticle>>? getMostViewedArticles() {
    return Future.value(
        mostViewedArticleBox?.values.toList() as List<MostViewedArticle>);
  }
}
