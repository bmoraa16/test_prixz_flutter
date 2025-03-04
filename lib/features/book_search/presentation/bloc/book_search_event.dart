part of 'book_search_bloc.dart';

abstract class BookSearchEvent extends Equatable {
  const BookSearchEvent();

  @override
  List<Object?> get props => [];
}

class BookSearchInitializeEvent extends BookSearchEvent {
  const BookSearchInitializeEvent();

  @override
  List<Object?> get props => [];
}

class BookSearchQueryEvent extends BookSearchEvent {
  final String query;

  const BookSearchQueryEvent(this.query);

  @override
  List<Object?> get props => [query];
}
