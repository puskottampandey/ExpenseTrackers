import 'package:expensetracker/core/common_model/media.dart';
import 'package:flutter/foundation.dart';

class MediaModel {
  final int id;
  final String relatedTo;
  final List<Media> medias;
  MediaModel({
    required this.id,
    required this.relatedTo,
    required this.medias,
  });

  MediaModel copyWith({
    int? id,
    String? relatedTo,
    List<Media>? medias,
  }) {
    return MediaModel(
      id: id ?? this.id,
      relatedTo: relatedTo ?? this.relatedTo,
      medias: medias ?? this.medias,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'relatedTo': relatedTo,
      'medias': medias.map((x) => x.toMap()).toList(),
    };
  }

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
        id: map['id'] ?? -1,
        relatedTo: map['relatedTo'] ?? "",
        medias: List.from(map['medias'] ?? [])
            .map((e) => Media.fromMap(e))
            .toList());
  }

  @override
  bool operator ==(covariant MediaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.relatedTo == relatedTo &&
        listEquals(other.medias, medias);
  }

  @override
  int get hashCode => id.hashCode ^ relatedTo.hashCode ^ medias.hashCode;
}
