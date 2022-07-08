import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicpa_assessment_flutter/features/presentations/cubit/article_data_cubit.dart';
import 'package:sicpa_assessment_flutter/injection_container.dart';

class MostViewedArticlePage extends StatefulWidget {
  const MostViewedArticlePage({Key? key}) : super(key: key);

  @override
  _MostViewedArticlePageState createState() => _MostViewedArticlePageState();
}

class _MostViewedArticlePageState extends State<MostViewedArticlePage> {
  final cubit = ArticleDataCubit(
      getMostViewedArticle: sl(),
      getMostSharedArticle: sl(),
      getMostEmailedArticle: sl());

  @override
  void initState() {
    addMostViewedArticlePageEvent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addMostViewedArticlePageEvent() {
    cubit.getMostViewedArticleCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Most Viewed Articles',
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
            } else if (state is LoadedMostViewedArticles) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.mostViewedArticles.length,
                itemBuilder: (_, int index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.mostViewedArticles[index].title, overflow: TextOverflow.visible),
                          Text(state.mostViewedArticles[index].date),
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
