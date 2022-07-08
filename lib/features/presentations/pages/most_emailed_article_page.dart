import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicpa_assessment_flutter/features/presentations/cubit/article_data_cubit.dart';
import 'package:sicpa_assessment_flutter/injection_container.dart';

class MostEmailedArticlePage extends StatefulWidget {
  const MostEmailedArticlePage({Key? key}) : super(key: key);

  @override
  _MostEmailedArticlePageState createState() => _MostEmailedArticlePageState();
}

class _MostEmailedArticlePageState extends State<MostEmailedArticlePage> {
  final cubit = ArticleDataCubit(
      getMostViewedArticle: sl(),
      getMostSharedArticle: sl(),
      getMostEmailedArticle: sl());

  @override
  void initState() {
    addMostEmailedArticlePageEvent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addMostEmailedArticlePageEvent() {
    cubit.getMostEmailedArticleCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Most Emailed Articles',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<ArticleDataCubit, ArticleDataState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedMostEmailedArticles) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.mostEmailedArticles.length,
                itemBuilder: (_, int index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.mostEmailedArticles[index].title, overflow: TextOverflow.visible),
                          Text(state.mostEmailedArticles[index].date),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
