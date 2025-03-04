part of 'book_details_bloc.dart';

abstract class BookDetailsEvent extends Equatable {
  const BookDetailsEvent();

  @override
  List<Object> get props => [];
}

class BookDetailsInitializeEvent extends BookDetailsEvent {
  const BookDetailsInitializeEvent();

  @override
  List<Object> get props => [];
}
