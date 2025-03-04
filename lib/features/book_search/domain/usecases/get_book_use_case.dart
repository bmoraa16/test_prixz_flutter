import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:prueba_prix/core/error.dart';
import 'package:prueba_prix/features/book_search/domain/entities/openlibrary_search_response.dart';
import 'package:prueba_prix/features/book_search/domain/repositories/book_search_repository.dart';

@lazySingleton
class GetBooksUseCase {
  final BookSearchRepository _bookSearchRepository;

  GetBooksUseCase(this._bookSearchRepository);

  Future<Result<OpenLibrarySearchResponse, HBError>> execute(
    String book,
  ) async {
    return await _bookSearchRepository.getBook(
      book: book,
    );
  }
}
