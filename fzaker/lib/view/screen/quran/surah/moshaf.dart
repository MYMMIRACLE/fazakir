import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
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
            return ListView.builder(
              itemBuilder: (context, index) {
                final moshaf = state.quranDataList[index];
                return Text(
                  '${moshaf.ayat} (${moshaf.verseIDAr})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontFamily: 'cairo'),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
