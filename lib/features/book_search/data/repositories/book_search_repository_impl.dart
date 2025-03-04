import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:prueba_prix/core/error.dart';
import 'package:prueba_prix/features/book_search/data/datasources/book_search_datasource.dart';
import 'package:prueba_prix/features/book_search/data/mapper/mapper_domain.dart';
import 'package:prueba_prix/features/book_search/domain/entities/openlibrary_search_response.dart';
import 'package:prueba_prix/features/book_search/domain/repositories/book_search_repository.dart';

@Injectable(as: BookSearchRepository)
class DrSearchRepositoryImpl implements BookSearchRepository {
  final BookSearchDataSource _bookSearchDataSource;

  DrSearchRepositoryImpl(this._bookSearchDataSource);

  @override
  Future<Result<OpenLibrarySearchResponse, HBError>> getBook({
    required String book,
  }) async {
    final result = await _bookSearchDataSource.getBook(
      book: book,
    );
    if (result.isSuccess()) {
      return Result.success(result.getOrThrow().toDomain);
    }

    return Result.error(result.tryGetError()!);
  }
}
