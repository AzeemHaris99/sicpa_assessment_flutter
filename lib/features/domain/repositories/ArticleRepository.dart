import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<MostViewedArticle>>>? getMostViewedArticles();
  Future<Either<Failure, List<MostSharedArticle>>>? getMostSharedArticles();
  Future<Either<Failure, List<MostEmailedArticle>>>? getMostEmailedArticles();
}