import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';
import 'package:clean_architectire_flutter/features/feed/domain/repositories/article_repository.dart';
import 'package:flutter/material.dart';

class MockRemoteArticleRepository implements ArticleRepository {
  @override
  Future<List<Article>> getArticles() async {
    // Mock data for testing
    return [
      Article(
          title: 'Sample Job 1',
          description: 'Description 1',
          image: Image.asset('assets/logo.png')),
      Article(
          title: 'Sample Job 2',
          description: 'Description 2',
          image:Image.asset('assets/logo.png')),
      Article(
          title: 'Sample Job 3',
          description: 'Description 3',
          image:Image.asset('assets/logo.png')),
      Article(
          title: 'Sample Job 4',
          description: 'Description 4',
          image: Image.asset('assets/logo.png')),
    ];
  }
}
