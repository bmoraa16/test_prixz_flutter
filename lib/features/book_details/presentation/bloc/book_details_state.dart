part of 'book_details_bloc.dart';

abstract class BookDetailsState extends Equatable {
  const BookDetailsState();

  @override
  List<Object> get props => [];
}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsError extends BookDetailsState {
  final String message;
  const BookDetailsError(this.message);
}
