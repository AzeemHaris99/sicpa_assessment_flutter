import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';
import 'package:sicpa_assessment_flutter/core/usecases/usecase.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/repositories/ArticleRepository.dart';

class GetMostEmailedArticle implements UseCase<MostEmailedArticle> {
  final ArticleRepository repository;

  GetMostEmailedArticle(this.repository);

  @override
  Future<Either<Failure, List<MostEmailedArticle>>>? call() async {
    return await Future.value(repository.getMostEmailedArticles());
  }
}
