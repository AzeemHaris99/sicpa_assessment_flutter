import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';
import 'package:sicpa_assessment_flutter/core/usecases/usecase.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/repositories/ArticleRepository.dart';

class GetMostViewedArticle implements UseCase<MostViewedArticle> {
  final ArticleRepository repository;

  GetMostViewedArticle(this.repository);

  @override
  Future<Either<Failure, List<MostViewedArticle>>>? call() async {
    return await Future.value(repository.getMostViewedArticles());
  }
}
