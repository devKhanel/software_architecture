import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';

// Define the state for the feed page
class FeedState {
  final List<Article> articles;

  FeedState(this.articles);

  // Factory constructor for the initial state
  factory FeedState.initial() {
    return FeedState([]);
  }
}
