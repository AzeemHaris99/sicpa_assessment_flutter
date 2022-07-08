import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostEmailedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostSharedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/entities/MostViewedArticle.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_emailed_article.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_shared_article.dart';
import 'package:sicpa_assessment_flutter/features/domain/usecases/get_most_viewed_article.dart';

part 'article_data_state.dart';

class ArticleDataCubit extends Cubit<ArticleDataState> {
  final GetMostViewedArticle _getMostViewedArticle;
  final GetMostSharedArticle _getMostSharedArticle;
  final GetMostEmailedArticle _getMostEmailedArticle;

  ArticleDataCubit(
      {required GetMostViewedArticle getMostViewedArticle,
      required GetMostSharedArticle getMostSharedArticle,
      required GetMostEmailedArticle getMostEmailedArticle})
      : _getMostViewedArticle = getMostViewedArticle,
        _getMostSharedArticle = getMostSharedArticle,
        _getMostEmailedArticle = getMostEmailedArticle,
        super(Empty());

  Future<void> getMostViewedArticleCubit() async {
    emit(Loading());
    final mostViewedArticleEither = await _getMostViewedArticle();
    mostViewedArticleEither?.fold((failure) {
      emit(Error(message: failure.toString()));
    }, (data) {
      emit(LoadedMostViewedArticles(mostViewedArticles: data));
    });
  }

  Future<void> getMostSharedArticleCubit() async {
    emit(Loading());
    final mostSharedArticleEither = await _getMostSharedArticle();
    mostSharedArticleEither?.fold((failure) {
      emit(Error(message: failure.toString()));
    }, (data) {
      emit(LoadedMostSharedArticles(mostSharedArticles: data));
    });
  }

  Future<void> getMostEmailedArticleCubit() async {
    emit(Loading());
    final mostEmailedArticleEither = await _getMostEmailedArticle();
    mostEmailedArticleEither?.fold((failure) {
      emit(Error(message: failure.toString()));
    }, (data) {
      emit(LoadedMostEmailedArticles(mostEmailedArticles: data));
    });
  }
}
