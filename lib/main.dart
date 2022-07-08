import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/data/models/most_emailed_article_model.dart';
import 'features/data/models/most_shared_article_model.dart';
import 'features/data/models/most_viewed_article_model.dart';
import 'features/presentations/pages/home.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

Box? mostSharedArticleBox;
Box? mostEmailedArticleBox;
Box? mostViewedArticleBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(MostViewedArticleModelAdapter());
  Hive.registerAdapter(MostSharedArticleModelAdapter());
  Hive.registerAdapter(MostEmailedArticleModelAdapter());

  await Hive.openLazyBox('mostViewedArticles');
  await Hive.openLazyBox('mostSharedArticles');
  await Hive.openLazyBox('mostEmailedArticles');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
