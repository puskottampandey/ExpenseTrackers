class MultiLanguage {
  final String? en;

  final String? ne;
  MultiLanguage({
    required this.en,
    required this.ne,
  });

  MultiLanguage copyWith({
    String? en,
    String? ne,
  }) {
    return MultiLanguage(
      en: en ?? this.en,
      ne: ne ?? this.ne,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'ne': ne,
    };
  }

  factory MultiLanguage.fromMap(Map<String, dynamic> json) {
    return MultiLanguage(
      en: json['en'] ?? "",
      ne: json['ne'] ?? "",
    );
  }

  factory MultiLanguage.initial() {
    return MultiLanguage(en: "", ne: "");
  }

  // factory MultiLanguage.dummy() {
  //   return MultiLanguage(en: "Nameenglish", ne: "nepali");
  // }
}
