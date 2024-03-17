class SurahModel {
  String suraNo;
  String suraName;
  String para;
  String totalAyat;
  String engName;

  SurahModel({
    required this.suraNo,
    required this.suraName,
    required this.para,
    required this.totalAyat,
    required this.engName,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      suraNo: json['sura_no'],
      suraName: json['sura_name'],
      para: json['para'],
      totalAyat: json['total_ayat'],
      engName: json['eng_name'],
    );
  }
}
