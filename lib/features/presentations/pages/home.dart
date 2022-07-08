import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicpa_assessment_flutter/features/presentations/cubit/article_data_cubit.dart';
import 'package:sicpa_assessment_flutter/features/presentations/pages/search_article_page.dart';
import 'package:sicpa_assessment_flutter/injection_container.dart';

import 'most_emailed_article_page.dart';
import 'most_shared_article_page.dart';
import 'most_viewed_article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'New York Times',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchArticleCard(context),
            mostViewedArticleCard(context),
            mostSharedArticleCard(context),
            mostEmailedArticleCard(context)
          ],
        ),
      ),
    );
  }

  InkWell searchArticleCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<SearchArticlePage>(
            builder: (BuildContext context) {
              return SearchArticlePage();
            },
          ),
        );
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          child: Row(
            children: const [
              Text('Search Articles'),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }

  InkWell mostViewedArticleCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<MostViewedArticlePage>(
            builder: (BuildContext context) {
              return BlocProvider(
                create: (_) => sl<ArticleDataCubit>(),
                child: const MostViewedArticlePage(),
              );
            },
          ),
        );
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          child: Row(
            children: const [
              Text('Most Viewed Articles'),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }

  InkWell mostSharedArticleCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<MostSharedArticlePage>(
            builder: (BuildContext context) {
              return BlocProvider(
                create: (_) => sl<ArticleDataCubit>(),
                child: const MostSharedArticlePage(),
              );
            },
          ),
        );
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          child: Row(
            children: const [
              Text('Most Shared Articles'),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }

  InkWell mostEmailedArticleCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<MostEmailedArticlePage>(
            builder: (BuildContext context) {
              return BlocProvider(
                create: (_) => sl<ArticleDataCubit>(),
                child: const MostEmailedArticlePage(),
              );
            },
          ),
        );
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          child: Row(
            children: const [
              Text('Most Emailed Articles'),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
