// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_library_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenLibrarySearchResponseDto _$OpenLibrarySearchResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OpenLibrarySearchResponseDto(
      numFound: (json['numFound'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toInt(),
      numFoundExact: json['numFoundExact'] as bool?,
      numFoundSnake: (json['num_found'] as num?)?.toInt(),
      documentationUrl: json['documentation_url'] as String?,
      q: json['q'] as String?,
      offset: (json['offset'] as num?)?.toInt(),
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => DocDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpenLibrarySearchResponseDtoToJson(
        OpenLibrarySearchResponseDto instance) =>
    <String, dynamic>{
      'numFound': instance.numFound,
      'start': instance.start,
      'numFoundExact': instance.numFoundExact,
      'num_found': instance.numFoundSnake,
      'documentation_url': instance.documentationUrl,
      'q': instance.q,
      'offset': instance.offset,
      'docs': instance.docs,
    };
