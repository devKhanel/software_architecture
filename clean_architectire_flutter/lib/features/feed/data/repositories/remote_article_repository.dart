import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';
import 'package:clean_architectire_flutter/features/feed/domain/repositories/article_repository.dart';


class RemoteArticleRepository implements ArticleRepository {
  @override
  Future<List<Article>> getArticles() {
    // Implement logic to fetch job articles from a remote API
    // Example: return await apiClient.getArticles();
    throw UnimplementedError();
  }
}
