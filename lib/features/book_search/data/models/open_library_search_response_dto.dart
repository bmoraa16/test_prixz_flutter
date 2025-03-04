import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_prix/features/book_search/data/models/doc_dto.dart';

part 'open_library_search_response_dto.g.dart';

@JsonSerializable()
class OpenLibrarySearchResponseDto {
  @JsonKey(name: 'numFound')
  final int? numFound;

  @JsonKey(name: 'start')
  final int? start;

  @JsonKey(name: 'numFoundExact')
  final bool? numFoundExact;

  @JsonKey(name: 'num_found')
  final int? numFoundSnake;

  @JsonKey(name: 'documentation_url')
  final String? documentationUrl;

  @JsonKey(name: 'q')
  final String? q;

  @JsonKey(name: 'offset')
  final int? offset;

  @JsonKey(name: 'docs')
  final List<DocDto>? docs;

  const OpenLibrarySearchResponseDto({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.numFoundSnake,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  factory OpenLibrarySearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OpenLibrarySearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OpenLibrarySearchResponseDtoToJson(this);
}
