part of 'search_book_bloc.dart';

abstract class SearchBookEvent extends Equatable {
  const SearchBookEvent();

  @override
  List<Object> get props => [];
}

class SearchBookInitializeEvent extends SearchBookEvent {
  const SearchBookInitializeEvent();

  @override
  List<Object> get props => [];
}
