import 'package:hive/hive.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';

part 'most_viewed_article_model.g.dart';

class MostViewedArticleResponseModel {
  List<MostViewedArticle> mostViewedArticles;

  MostViewedArticleResponseModel({required this.mostViewedArticles});

  factory MostViewedArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return MostViewedArticleResponseModel(
        mostViewedArticles: json['results'] != null
            ? List<MostViewedArticleModel>.from(
                (json['results'] as List<dynamic>)
                    .map((e) => MostViewedArticleModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 0)
class MostViewedArticleModel extends MostViewedArticle {
  const MostViewedArticleModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String date,
  }) : super(
      id: id,
      title: title,
      date: date);

  factory MostViewedArticleModel.fromJson(Map<String, dynamic> json) {
    return MostViewedArticleModel(
      id: json['id'],
      title: json['title'],
      date: json['published_date'],
    );
  }
}
