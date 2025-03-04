// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocDto _$DocDtoFromJson(Map<String, dynamic> json) => DocDto(
      authorKey: (json['author_key'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      authorName: (json['author_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coverEditionKey: json['cover_edition_key'] as String?,
      coverI: (json['cover_i'] as num?)?.toInt(),
      editionCount: (json['edition_count'] as num?)?.toInt(),
      firstPublishYear: (json['first_publish_year'] as num?)?.toInt(),
      hasFulltext: json['has_fulltext'] as bool?,
      ia: (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList(),
      keyWork: json['key'] as String?,
      language: (json['language'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publicScanB: json['public_scan_b'] as bool?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DocDtoToJson(DocDto instance) => <String, dynamic>{
      'author_key': instance.authorKey,
      'author_name': instance.authorName,
      'cover_edition_key': instance.coverEditionKey,
      'cover_i': instance.coverI,
      'edition_count': instance.editionCount,
      'first_publish_year': instance.firstPublishYear,
      'has_fulltext': instance.hasFulltext,
      'ia': instance.ia,
      'key': instance.keyWork,
      'language': instance.language,
      'public_scan_b': instance.publicScanB,
      'title': instance.title,
    };
