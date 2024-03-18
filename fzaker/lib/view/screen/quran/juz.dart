import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
import 'package:fazakir/view/screen/quran/surah/surah.dart';
import 'package:fazakir/view/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JuzScreen extends StatelessWidget {
  const JuzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return const Center(
            child: BuidLoadingIndicator(),
          );
        }
        if (state is QuranSuccess) {
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              final quran = state.quranDataList[index];
              return QuranDataCard(
                title: quran.sura,
                subTitle: "سورتان",
                leadingTitle: "من ص 1 الي 20",
                trailingTitle: "02",
                onTap: () {},
              );
            },
          );
        }
        return Container();
      },
    ));
  }
}
