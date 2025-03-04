part of 'book_search_bloc.dart';

abstract class BookSearchState extends Equatable {
  const BookSearchState();

  @override
  List<Object?> get props => [];
}

class BookSearchInitial extends BookSearchState {}

class BookSearchLoaded extends BookSearchState {
  final List<Doc> books;
  final bool isLoading;

  const BookSearchLoaded({
    required this.books,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [books, isLoading];
}

class BookSearchError extends BookSearchState {
  final String message;
  const BookSearchError(this.message);

  @override
  List<Object?> get props => [message];
}
