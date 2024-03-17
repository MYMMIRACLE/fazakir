import 'package:fazakir/view/screen/quran/surah.dart';
import 'package:flutter/material.dart';

class JuzScreen extends StatelessWidget {
  const JuzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) => QuranDataCard(
        title: "الجزء الاول",
        subTitle: "سورتان",
        leadingTitle: "من ص 1 الي 20",
        trailingTitle: "02",
        onTap: () {},
      ),
    ));
  }
}
