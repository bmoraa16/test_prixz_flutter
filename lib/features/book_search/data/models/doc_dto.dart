import 'package:json_annotation/json_annotation.dart';

part 'doc_dto.g.dart';

@JsonSerializable()
class DocDto {
  @JsonKey(name: 'author_key')
  final List<String>? authorKey;

  @JsonKey(name: 'author_name')
  final List<String>? authorName;

  @JsonKey(name: 'cover_edition_key')
  final String? coverEditionKey;

  @JsonKey(name: 'cover_i')
  final int? coverI;

  @JsonKey(name: 'edition_count')
  final int? editionCount;

  @JsonKey(name: 'first_publish_year')
  final int? firstPublishYear;

  @JsonKey(name: 'has_fulltext')
  final bool? hasFulltext;

  @JsonKey(name: 'ia')
  final List<String>? ia;

  @JsonKey(name: 'key')
  final String? keyWork;

  @JsonKey(name: 'language')
  final List<String>? language;

  @JsonKey(name: 'public_scan_b')
  final bool? publicScanB;

  @JsonKey(name: 'title')
  final String? title;

  const DocDto({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.ia,
    this.keyWork,
    this.language,
    this.publicScanB,
    this.title,
  });

  factory DocDto.fromJson(Map<String, dynamic> json) => _$DocDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DocDtoToJson(this);
}
