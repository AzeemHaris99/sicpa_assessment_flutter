part of 'article_data_cubit.dart';

abstract class ArticleDataState extends Equatable {
  const ArticleDataState();

  @override
  List<Object> get props => [];
}

class Empty extends ArticleDataState {}

class Loading extends ArticleDataState {}

class LoadedMostViewedArticles extends ArticleDataState {
  final List<MostViewedArticle> mostViewedArticles;
  const LoadedMostViewedArticles({required this.mostViewedArticles});
}

class LoadedMostSharedArticles extends ArticleDataState {
  final List<MostSharedArticle> mostSharedArticles;
  const LoadedMostSharedArticles({required this.mostSharedArticles});
}

class LoadedMostEmailedArticles extends ArticleDataState {
  final List<MostEmailedArticle> mostEmailedArticles;
  const LoadedMostEmailedArticles({required this.mostEmailedArticles});
}

class Error extends ArticleDataState {
  final String message;
  const Error({required this.message});
}