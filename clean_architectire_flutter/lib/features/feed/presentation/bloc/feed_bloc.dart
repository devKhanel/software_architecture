import 'package:clean_architectire_flutter/features/feed/domain/entities/article.dart';
import 'package:clean_architectire_flutter/features/feed/domain/usecases/get_articles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the state for the feed page
class FeedState {
  final List<Article> articles;

  FeedState(this.articles);
}

// Define the events that can trigger state changes
abstract class FeedEvent {}

class FetchArticles extends FeedEvent {}

// Create the bloc for managing the state of the feed page
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetArticles getArticles;

  FeedBloc(this.getArticles) : super(FeedState([]));

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is FetchArticles) {
      try {
        final articles = await getArticles.execute();
        yield FeedState(articles);
      } catch (e) {
        // Handle error state
      }
    }
  }
}
