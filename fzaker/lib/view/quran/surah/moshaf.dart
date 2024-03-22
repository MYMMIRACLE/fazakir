import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:fazakir/core/constant/color.dart';
import 'package:fazakir/data/model/ayat_model.dart';
import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoshafScreen extends StatefulWidget {
  const MoshafScreen({super.key, required this.surahName});
  final String surahName;
  @override
  State<MoshafScreen> createState() => _MoshafScreenState();
}

class _MoshafScreenState extends State<MoshafScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuranCubit>(context).quranVerse(jsonName: widget.surahName);
  }

  List<QuranVerse> quranDataList = [];
  ArabicNumbers arabicNumber = ArabicNumbers();
  int linesPerPage = 15;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        if (state is QuranSuccess) {
          quranDataList = state.quranDataList;
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
          color: MyColors.green.withOpacity(0.3),
          padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 10.w),
          child: ListView.builder(
              itemCount: quranDataList.length,
              itemBuilder: (context, index) {
                return quranDataList[index]
                        .ayat
                        .contains("بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ")
                    ? Container(
                        margin: EdgeInsets.only(bottom: 15.w),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 3,
                            )),
                        child: CustomText(
                          '${quranDataList[index].ayat} (${arabicNumber.convert(quranDataList[index].verseIDAr)})',
                          textAlign: TextAlign.center,
                          fontSize: 28,
                          color: MyColors.green,
                        ),
                      )
                    : CustomText(
                        '${quranDataList[index].ayat} (${arabicNumber.convert(quranDataList[index].verseIDAr)})',
                        textAlign: TextAlign.center,
                        fontSize: 24,
                        color: MyColors.black,
                      );
              }),
        ));
      },
    );
  }
}

/*
 import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:fazakir/core/constant/color.dart';
import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
	@@ -9,47 +7,61 @@ import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoshafScreen extends StatefulWidget {
  const MoshafScreen({Key? key}) : super(key: key);

  @override
  State<MoshafScreen> createState() => _MoshafScreenState();
}

class _MoshafScreenState extends State<MoshafScreen> {
  late ArabicNumbers arabicNumber;
  late PageController _pageController;
  final int linesPerPage = 15;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuranCubit>(context).quranVerse();
    arabicNumber = ArabicNumbers();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(
                 child: BuildLoadingIndicator(),
                );
          }
          if (state is QuranSuccess) {
            return Container(
              color: MyColors.green.withOpacity(0.2),
              child: PageView.builder(
                controller: _pageController,
                reverse: true, // Enable right-to-left scrolling
                itemCount: ((state.quranDataList.length / linesPerPage)).ceil(),
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * linesPerPage;
                  final endIndex = startIndex + linesPerPage;
                  final pageAyats = state.quranDataList.sublist(
                    startIndex,
                    endIndex.clamp(0, state.quranDataList.length),
                  );

                  return ListView.builder(
                    itemCount: pageAyats.length,
                    itemBuilder: (context, index) {
                      final moshaf = pageAyats[index];
                      return CustomText(
                        '${moshaf.ayat} (${arabicNumber.convert(moshaf.verseIDAr)})',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                      );
                    },
                  );
                },
              ),
            );

 */