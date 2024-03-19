

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:fazakir/core/constant/color.dart';
import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:fazakir/view/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoshafScreen extends StatefulWidget {
  const MoshafScreen({super.key});

  @override
  State<MoshafScreen> createState() => _MoshafScreenState();
}

class _MoshafScreenState extends State<MoshafScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuranCubit>(context).quranVerse();
  }

  ArabicNumbers arabicNumber = ArabicNumbers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(
              child: BuidLoadingIndicator(),
            );
          }
          if (state is QuranSuccess) {
            return Container(
              color: MyColors.green.withOpacity(0.2),
              child: PageView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListView.builder(
                      itemCount: state.quranDataList.length,
                      itemBuilder: (context, index) {
                        final moshaf = state.quranDataList[index];
                        return CustomText(
                          '${moshaf.ayat} (${arabicNumber.convert(moshaf.verseIDAr)})',
                          textAlign: TextAlign.center,
                          fontSize: 20,
                        );
                      });
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
