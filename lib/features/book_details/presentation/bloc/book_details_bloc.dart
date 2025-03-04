import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:prueba_prix/core/constants/app_dictionary.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

@singleton
class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc() : super(BookDetailsInitial()) {
    on<BookDetailsInitializeEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    BookDetailsInitializeEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    emit(BookDetailsLoading());

    try {} catch (e) {
      emit(
        BookDetailsError('${AppDictionary.genericError}: $e'),
      );
    }
  }
}
