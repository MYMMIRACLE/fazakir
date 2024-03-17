class HadithDataModel {
  final String metadataName;
  // final Map<String, dynamic> section;
  // final int sectionDetailHadithNumberFirst;
  // final int sectionDetailHadithNumberLast;
  // final int sectionDetailArabicNumberFirst;
  // final int sectionDetailArabicNumberLast;
  final String hadithText;
  final int hadithReferenceBook;
  final int hadithReferenceHadith;

  HadithDataModel({
    required this.metadataName,
    // required this.section,
    // required this.sectionDetailHadithNumberFirst,
    // required this.sectionDetailHadithNumberLast,
    // required this.sectionDetailArabicNumberFirst,
    // required this.sectionDetailArabicNumberLast,
    required this.hadithText,
    required this.hadithReferenceBook,
    required this.hadithReferenceHadith,
  });

  factory HadithDataModel.fromJson(Map<String, dynamic> json) {
    return HadithDataModel(
      metadataName: json['metadata']['name'],
      // section: json['metadata']['section'],
      // sectionDetailHadithNumberFirst: json['metadata']['section_detail']['2']
      //     ['hadithnumber_first'],
      // sectionDetailHadithNumberLast: json['metadata']['section_detail']['2']
      //     ['hadithnumber_last'],
      // sectionDetailArabicNumberFirst: json['metadata']['section_detail']['2']
      //     ['arabicnumber_first'],
      // sectionDetailArabicNumberLast: json['metadata']['section_detail']['2']
      //     ['arabicnumber_last'],
      hadithText: json['hadith']['text'],
      hadithReferenceBook: json['hadith']['reference']['book'],
      hadithReferenceHadith: json['hadith']['reference']['hadith'],
    );
  }
}
