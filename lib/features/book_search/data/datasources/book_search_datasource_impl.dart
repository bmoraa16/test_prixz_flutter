import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:prueba_prix/core/constants/test_prixz_urls.dart';
import 'package:prueba_prix/core/error.dart';
import 'package:prueba_prix/core/managers/network_manager.dart';
import 'package:prueba_prix/features/book_search/data/datasources/book_search_datasource.dart';
import 'package:prueba_prix/features/book_search/data/models/open_library_search_response_dto.dart';

@Injectable(as: BookSearchDataSource)
class DrSearchDataSourceImpl implements BookSearchDataSource {
  final NetworkManager _networkManager;

  DrSearchDataSourceImpl(
    this._networkManager,
  );

  @override
  Future<Result<OpenLibrarySearchResponseDto, HBError>> getBook({
    required String book,
  }) async {
    final request = Request(
      url: TestPrixzUrls.getBooks,
      queryParams: {
        'q': book,
        //'limit': '10',
      },
      method: RequestType.get,
    );
    return await _networkManager.call<OpenLibrarySearchResponseDto>(
      mapper: OpenLibrarySearchResponseDto.fromJson,
      request: request,
      errorMsg: "Error to Search Books",
    );
  }
}
