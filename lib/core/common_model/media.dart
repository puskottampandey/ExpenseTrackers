class Media {
  final String id;
  final String createdAt;

  final String type;
  final String path;
  final String name;

  Media({
    required this.id,
    required this.createdAt,
    required this.type,
    required this.path,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'type': type,
      'path': path,
      'name': name,
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      id: map['id'] ?? "",
      createdAt: map['createdAt'] ?? "",
      type: map['type'] ?? "",
      path: map['path'] ?? "",
      name: map['name'] ?? "",
    );
  }

  Media copyWith({
    String? id,
    String? createdAt,
    String? fileName,
    String? type,
    String? path,
    String? name,
  }) {
    return Media(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      path: path ?? this.path,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Media(id: $id, createdAt: $createdAt, type: $type, path: $path)';
  }

  @override
  bool operator ==(covariant Media other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.type == type &&
        other.path == path;
  }

  @override
  int get hashCode {
    return id.hashCode ^ createdAt.hashCode ^ type.hashCode ^ path.hashCode;
  }

  bool get isImage {
    String type = path.split(".").last;

    if (type == "jpg" || type == "png" || type == "jpeg") {
      return true;
    }
    return false;
  }

  bool get isDoc {
    String type = path.split(".").last;

    if (type == "doc" || type == "docx") {
      return true;
    }
    return false;
  }

  bool get isPdf {
    String type = path.split(".").last;

    if (type == "pdf") {
      return true;
    }
    return false;
  }

  bool get isAudio {
    String type = path.split(".").last;

    if (type == "mpeg" || type == "wav" || type == "mp3" || type == "ogg") {
      return true;
    }
    return false;
  }

  bool get isVideo {
    String type = path.split(".").last;

    if (type == "mp4") {
      return true;
    }
    return false;
  }
}
