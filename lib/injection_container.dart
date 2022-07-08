// TODO Implement this library.
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sicpa_assessment_flutter/core/network/network_info.dart';
import 'package:sicpa_assessment_flutter/features/data/datasources/article_data_source.dart';
import 'package:sicpa_assessment_flutter/features/data/datasources/article_local_data_source.dart';
import 'package:sicpa_assessment_flutter/features/data/repositories/article_repository_iml.dart';
import 'package:sicpa_assessment_flutter/features/domain/repositories/ArticleRepository.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_emailed_article.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_shared_article.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_viewed_article.dart';
import 'package:sicpa_assessment_flutter/features/presentations/cubit/article_data_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ArticleDataCubit(
      getMostViewedArticle: sl(),
      getMostSharedArticle: sl(),
      getMostEmailedArticle: sl()));

  // Use cases
  sl.registerFactory(() => GetMostViewedArticle(sl()));
  sl.registerFactory(() => GetMostSharedArticle(sl()));
  sl.registerFactory(() => GetMostEmailedArticle(sl()));

  // Repository
  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(
      articleDataSource: sl(),
      articleLocalDataSource: sl(),
      networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<ArticleDataSource>(
      () => ArticleDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<ArticleLocalDataSource>(
      () => ArticleLocalDataSourceImpl());

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
