import 'package:prueba_prix/features/book_search/data/models/doc_dto.dart';
import 'package:prueba_prix/features/book_search/data/models/open_library_search_response_dto.dart';
import 'package:prueba_prix/features/book_search/domain/entities/doc.dart';
import 'package:prueba_prix/features/book_search/domain/entities/openlibrary_search_response.dart';

extension MapperOpenLibrarySearchResponseDto on OpenLibrarySearchResponseDto {
  OpenLibrarySearchResponse get toDomain {
    return OpenLibrarySearchResponse(
      numFound: numFound,
      start: start,
      numFoundExact: numFoundExact,
      numFoundSnake: numFoundSnake,
      documentationUrl: documentationUrl,
      q: q,
      offset: offset,
      docs: docs?.map((data) => data.toDomain).toList(),
    );
  }
}

extension MapperDocDto on DocDto {
  Doc get toDomain {
    return Doc(
      authorKey: authorKey,
      authorName: authorName,
      coverEditionKey: coverEditionKey,
      coverI: coverI,
      editionCount: editionCount,
      firstPublishYear: firstPublishYear,
      hasFulltext: hasFulltext,
      ia: ia,
      docKey: keyWork,
      language: language,
      publicScanB: publicScanB,
      title: title,
    );
  }
}
