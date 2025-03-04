import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:prueba_prix/core/constants/app_dictionary.dart';

part 'search_book_event.dart';
part 'search_book_state.dart';

@singleton
class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  SearchBookBloc() : super(SearchBookInitial()) {
    on<SearchBookInitializeEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    SearchBookInitializeEvent event,
    Emitter<SearchBookState> emit,
  ) async {
    emit(SearchBookLoading());

    try {} catch (e) {
      emit(
        SearchBookError('${AppDictionary.genericError}: $e'),
      );
    }
  }
}
