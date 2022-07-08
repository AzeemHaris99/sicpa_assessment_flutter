import 'package:hive/hive.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';

part 'most_shared_article_model.g.dart';

class MostSharedArticleResponseModel {
  List<MostSharedArticle> mostSharedArticles;

  MostSharedArticleResponseModel({required this.mostSharedArticles});

  factory MostSharedArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return MostSharedArticleResponseModel(
        mostSharedArticles: json['results'] != null
            ? List<MostSharedArticleModel>.from(
                (json['results'] as List<dynamic>)
                    .map((e) => MostSharedArticleModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 1)
class MostSharedArticleModel extends MostSharedArticle {
  const MostSharedArticleModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String date,
  }) : super(
      id: id, 
      title: title,
      date: date);

  factory MostSharedArticleModel.fromJson(Map<String, dynamic> json) {
    return MostSharedArticleModel(
      id: json['id'],
      title: json['title'],
      date: json['published_date'],
    );
  }
}
