part of 'search_book_bloc.dart';

abstract class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

class SearchBookInitial extends SearchBookState {}

class SearchBookLoading extends SearchBookState {}

class SearchBookError extends SearchBookState {
  final String message;
  const SearchBookError(this.message);
}
