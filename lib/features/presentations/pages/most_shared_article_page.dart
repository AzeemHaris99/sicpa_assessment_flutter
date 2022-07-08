import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicpa_assessment_flutter/features/presentations/cubit/article_data_cubit.dart';
import 'package:sicpa_assessment_flutter/injection_container.dart';

class MostSharedArticlePage extends StatefulWidget {
  const MostSharedArticlePage({Key? key}) : super(key: key);

  @override
  _MostSharedArticlePageState createState() => _MostSharedArticlePageState();
}

class _MostSharedArticlePageState extends State<MostSharedArticlePage> {
  final cubit = ArticleDataCubit(
      getMostViewedArticle: sl(),
      getMostSharedArticle: sl(),
      getMostEmailedArticle: sl());

  @override
  void initState() {
    addMostSharedArticlePageEvent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addMostSharedArticlePageEvent() {
    cubit.getMostSharedArticleCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Most Shared Articles',
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
            } else if (state is LoadedMostSharedArticles) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.mostSharedArticles.length,
                itemBuilder: (_, int index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.mostSharedArticles[index].title, overflow: TextOverflow.visible),
                          Text(state.mostSharedArticles[index].date),
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
