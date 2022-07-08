import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sicpa_assessment_flutter/secrets.dart';

class SearchArticlePage extends StatefulWidget {
  SearchArticlePage({Key? key}) : super(key: key);

  final dio = Dio();

  @override
  _SearchArticlePageState createState() => _SearchArticlePageState();
}

class _SearchArticlePageState extends State<SearchArticlePage> {
  List _articles = List.empty();

  void searchArticles(String query) async {
    final response = await widget.dio.get(
      'https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=$apiKey&q=$query',
    );
    setState(() {
      _articles = response.data['response']['docs'];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Articles',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchForm(onSearch: searchArticles),
            _articles.isEmpty
                ? const Text('No results')
                : Expanded(
                    child: ListView(
                      children: _articles.map((article) {
                        return SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(article['snippet'].toString()),
                                Text(article['pub_date'].toString()),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({required this.onSearch});

  final void Function(String search) onSearch;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  var _search;

  @override
  Widget build(context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Search...',
              border: OutlineInputBorder(),
              filled: true,
            ),
            onChanged: (value) {
              _search = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a search term';
              }
              return null;
            },
          ),
          RawMaterialButton(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                widget.onSearch(_search);
              } else {
                setState(() {
                  _autoValidate = AutovalidateMode.always;
                });
              }
            },
            fillColor: Colors.black,
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
