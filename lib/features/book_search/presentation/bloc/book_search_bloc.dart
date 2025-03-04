import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:prueba_prix/features/book_search/domain/entities/doc.dart';
import 'package:prueba_prix/features/book_search/domain/usecases/get_book_use_case.dart';

part 'book_search_event.dart';
part 'book_search_state.dart';

@singleton
class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  final GetBooksUseCase _getBooksUseCase;
  List<Doc> _books = [];

  BookSearchBloc(this._getBooksUseCase) : super(BookSearchInitial()) {
    on<BookSearchInitializeEvent>(_onInitialize);
    on<BookSearchQueryEvent>(_onQuery);
  }

  Future<void> _onInitialize(
    BookSearchInitializeEvent event,
    Emitter<BookSearchState> emit,
  ) async {
    _books = [];
    emit(BookSearchLoaded(books: _books, isLoading: false));
  }

  Future<void> _onQuery(
    BookSearchQueryEvent event,
    Emitter<BookSearchState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      _books = [];
      emit(BookSearchLoaded(books: _books, isLoading: false));
      return;
    }

    emit(BookSearchLoaded(books: _books, isLoading: true));

    try {
      final result = await _getBooksUseCase.execute(query);
      result.when(
        (success) {
          _books = success.docs ?? [];
          emit(BookSearchLoaded(books: _books, isLoading: false));
        },
        (error) {
          emit(const BookSearchError('Ha ocurrido un error en la búsqueda'));
        },
      );
    } catch (e) {
      emit(BookSearchError('Excepción en la búsqueda: $e'));
    }
  }
}
