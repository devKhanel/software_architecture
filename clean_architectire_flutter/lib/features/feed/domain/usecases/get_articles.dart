import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';
import 'package:clean_architectire_flutter/features/feed/domain/repositories/article_repository.dart';

class GetArticles {
  final ArticleRepository repository;

  GetArticles(this.repository);

  Future<List<Article>> execute() {
    return repository.getArticles();
  }
}

class SearchArticles {
  final ArticleRepository repository;

  SearchArticles(this.repository);

  Future<void> execute(Article article) async {
    // Implement logic to save the provided article as a favorite
    // Example: await repository.saveFavoriteArticle(article);
    throw UnimplementedError();
  }
}

class SaveFavoriteArticle {
  final ArticleRepository repository;

  SaveFavoriteArticle(this.repository);

  Future<void> execute(Article article) async {
    // Implement logic to save the provided article as a favorite
    // Example: await repository.saveFavoriteArticle(article);
    throw UnimplementedError();
  }
}