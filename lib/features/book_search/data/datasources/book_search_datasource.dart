import 'package:multiple_result/multiple_result.dart';
import 'package:prueba_prix/core/error.dart';
import 'package:prueba_prix/features/book_search/data/models/open_library_search_response_dto.dart';

abstract interface class BookSearchDataSource {
  Future<Result<OpenLibrarySearchResponseDto, HBError>> getBook({
    required String book,
  });
}
