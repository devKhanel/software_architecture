
import 'package:clean_architectire_flutter/features/feed/data/repositories/mock_article_repository.dart';
import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles(){
    return MockRemoteArticleRepository().getArticles();
  }
}
