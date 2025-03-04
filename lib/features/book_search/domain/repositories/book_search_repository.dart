import 'package:multiple_result/multiple_result.dart';
import 'package:prueba_prix/core/error.dart';
import 'package:prueba_prix/features/book_search/domain/entities/openlibrary_search_response.dart';

abstract interface class BookSearchRepository {
  Future<Result<OpenLibrarySearchResponse, HBError>> getBook({
    required String book,
  });
}
