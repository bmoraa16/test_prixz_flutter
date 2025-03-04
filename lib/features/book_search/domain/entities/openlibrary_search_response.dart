import 'package:equatable/equatable.dart';

import 'doc.dart';

class OpenLibrarySearchResponse extends Equatable {
  final int? numFound;

  final int? start;

  final bool? numFoundExact;
  final int? numFoundSnake;

  final String? documentationUrl;

  final String? q;

  final int? offset;
  final List<Doc>? docs;

  const OpenLibrarySearchResponse({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.numFoundSnake,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  OpenLibrarySearchResponse copyWith({
    int? numFound,
    int? start,
    bool? numFoundExact,
    int? numFoundSnake,
    String? documentationUrl,
    String? q,
    int? offset,
    List<Doc>? docs,
  }) {
    return OpenLibrarySearchResponse(
      numFound: numFound ?? this.numFound,
      start: start ?? this.start,
      numFoundExact: numFoundExact ?? this.numFoundExact,
      numFoundSnake: numFoundSnake ?? this.numFoundSnake,
      documentationUrl: documentationUrl ?? this.documentationUrl,
      q: q ?? this.q,
      offset: offset ?? this.offset,
      docs: docs ?? this.docs,
    );
  }

  @override
  List<Object?> get props => [
        numFound,
        start,
        numFoundExact,
        numFoundSnake,
        documentationUrl,
        q,
        offset,
        docs,
      ];
}
