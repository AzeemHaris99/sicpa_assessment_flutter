import 'package:dartz/dartz.dart';
import 'package:sicpa_assessment_flutter/core/error/exceptions.dart';
import 'package:sicpa_assessment_flutter/core/error/failures.dart';
import 'package:sicpa_assessment_flutter/core/network/network_info.dart';
import 'package:sicpa_assessment_flutter/features/data/datasources/article_data_source.dart';
import 'package:sicpa_assessment_flutter/features/data/datasources/article_local_data_source.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/repositories/ArticleRepository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleDataSource articleDataSource;
  final ArticleLocalDataSource articleLocalDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl(
      {required this.articleDataSource,
      required this.articleLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<MostEmailedArticle>>>?
      getMostEmailedArticles() async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteMostEmailedArticles =
            await articleDataSource.getMostEmailedArticles();
        if (remoteMostEmailedArticles == null) {
          return Left(ServerFailure());
        } else {
          await articleLocalDataSource
              .cacheMostEmailedArticles(remoteMostEmailedArticles);
          return Right(remoteMostEmailedArticles);
        }
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMostEmailedArticles =
            await articleLocalDataSource.getMostEmailedArticles();
        if (localMostEmailedArticles == null) {
          return Left(CacheFailure());
        } else {
          return Right(localMostEmailedArticles);
        }
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MostSharedArticle>>>?
      getMostSharedArticles() async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteMostSharedArticles =
            await articleDataSource.getMostSharedArticles();
        if (remoteMostSharedArticles == null) {
          return Left(ServerFailure());
        } else {
          await articleLocalDataSource
              .cacheMostSharedArticles(remoteMostSharedArticles);
          return Right(remoteMostSharedArticles);
        }
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMostSharedArticles =
            await articleLocalDataSource.getMostSharedArticles();
        if (localMostSharedArticles == null) {
          return Left(CacheFailure());
        } else {
          return Right(localMostSharedArticles);
        }
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MostViewedArticle>>>?
      getMostViewedArticles() async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteMostViewedArticles =
            await articleDataSource.getMostViewedArticles();
        if (remoteMostViewedArticles == null) {
          return Left(ServerFailure());
        } else {
          await articleLocalDataSource
              .cacheMostViewedArticles(remoteMostViewedArticles);
          return Right(remoteMostViewedArticles);
        }
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMostViewedArticles =
            await articleLocalDataSource.getMostViewedArticles();
        if (localMostViewedArticles == null) {
          return Left(CacheFailure());
        } else {
          return Right(localMostViewedArticles);
        }
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }
}
