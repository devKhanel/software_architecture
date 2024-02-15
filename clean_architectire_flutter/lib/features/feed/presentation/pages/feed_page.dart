import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';
import 'package:clean_architectire_flutter/features/feed/domain/usecases/get_articles.dart';
import 'package:clean_architectire_flutter/features/feed/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  final GetArticles getArticles;

  const FeedPage({Key? key, required this.getArticles}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    final fetchedArticles = await widget.getArticles.execute();
    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Feed'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.all(20.0),
            child: BeautifulSearchBar(onSearch: (a) {
              print(a);
              return null;
            }),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    title: Text(articles[index].title),
                    subtitle: Text(articles[index].description),
                    leading: articles[index].image,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
