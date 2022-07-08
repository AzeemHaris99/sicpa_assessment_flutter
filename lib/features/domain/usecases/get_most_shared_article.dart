import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';
import 'package:sicpa_assessment_flutter/core/usecases/usecase.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/repositories/ArticleRepository.dart';

class GetMostSharedArticle implements UseCase<MostSharedArticle> {
  final ArticleRepository repository;

  GetMostSharedArticle(this.repository);

  @override
  Future<Either<Failure, List<MostSharedArticle>>>? call() async {
    return await Future.value(repository.getMostSharedArticles());
  }
}
