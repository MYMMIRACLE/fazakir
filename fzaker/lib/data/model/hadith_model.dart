class HadithDataModel {
  final String metadataName;
  final String hadithText;
  final int hadithReferenceBook;
  final int hadithReferenceHadith;

  HadithDataModel({
    required this.metadataName,
    required this.hadithText,
    required this.hadithReferenceBook,
    required this.hadithReferenceHadith,
  });

  factory HadithDataModel.fromJson(Map<String, dynamic> json) {
    return HadithDataModel(
      metadataName: json['metadata']['name'],
      hadithText: json['hadith']['text'],
      hadithReferenceBook: json['hadith']['reference']['book'],
      hadithReferenceHadith: json['hadith']['reference']['hadith'],
    );
  }
}
