import 'package:equatable/equatable.dart';

class Doc extends Equatable {
  final List<String>? authorKey;
  final List<String>? authorName;
  final String? coverEditionKey;
  final int? coverI;
  final int? editionCount;
  final int? firstPublishYear;
  final bool? hasFulltext;
  final List<String>? ia;
  final String? docKey;
  final List<String>? language;
  final bool? publicScanB;
  final String? title;

  const Doc({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.ia,
    this.docKey,
    this.language,
    this.publicScanB,
    this.title,
  });

  Doc copyWith({
    List<String>? authorKey,
    List<String>? authorName,
    String? coverEditionKey,
    int? coverI,
    int? editionCount,
    int? firstPublishYear,
    bool? hasFulltext,
    List<String>? ia,
    String? docKey,
    List<String>? language,
    bool? publicScanB,
    String? title,
  }) {
    return Doc(
      authorKey: authorKey ?? this.authorKey,
      authorName: authorName ?? this.authorName,
      coverEditionKey: coverEditionKey ?? this.coverEditionKey,
      coverI: coverI ?? this.coverI,
      editionCount: editionCount ?? this.editionCount,
      firstPublishYear: firstPublishYear ?? this.firstPublishYear,
      hasFulltext: hasFulltext ?? this.hasFulltext,
      ia: ia ?? this.ia,
      docKey: docKey ?? this.docKey,
      language: language ?? this.language,
      publicScanB: publicScanB ?? this.publicScanB,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        authorKey,
        authorName,
        coverEditionKey,
        coverI,
        editionCount,
        firstPublishYear,
        hasFulltext,
        ia,
        docKey,
        language,
        publicScanB,
        title,
      ];
}
