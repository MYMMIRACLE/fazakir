class QuranVerse {
  final String id;
  final String sura;
  final String verseIDAr;
  final String ayat;

  QuranVerse({
    required this.id,
    required this.sura,
    required this.verseIDAr,
    required this.ayat,
  });

  factory QuranVerse.fromJson(Map<String, dynamic> json) {
    return QuranVerse(
      id: json['id'] ?? '',
      sura: json['sura'] ?? '',
      verseIDAr: json['VerseIDAr'] ?? '',
      ayat: json['ayat'] ?? '',
    );
  }
}
