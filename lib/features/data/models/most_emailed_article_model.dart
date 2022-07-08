import 'package:hive/hive.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';

part 'most_emailed_article_model.g.dart';

class MostEmailedArticleResponseModel {
  List<MostEmailedArticle> mostEmailedArticles;

  MostEmailedArticleResponseModel({required this.mostEmailedArticles});

  factory MostEmailedArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return MostEmailedArticleResponseModel(
        mostEmailedArticles: json['results'] != null
            ? List<MostEmailedArticleModel>.from(
                (json['results'] as List<dynamic>)
                    .map((e) => MostEmailedArticleModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 2)
class MostEmailedArticleModel extends MostEmailedArticle {
  const MostEmailedArticleModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String date,
  }) : super(
      id: id, 
      title: title,
      date: date);

  factory MostEmailedArticleModel.fromJson(Map<String, dynamic> json) {
    return MostEmailedArticleModel(
      id: json['id'],
      title: json['title'],
      date: json['published_date'],
    );
  }
}
