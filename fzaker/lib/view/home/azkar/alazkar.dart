import 'package:fazakir/core/helper/decoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../nokdem_lk.dart';

class AlAzkarScreen extends StatefulWidget {
  const AlAzkarScreen({super.key});

  @override
  State<AlAzkarScreen> createState() => _AlAzkarScreenState();
}

class _AlAzkarScreenState extends State<AlAzkarScreen> {
  @override
  void initState() {
    super.initState();
    getAzkarContent();
  }

  List<String> azkarList = [];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("الاذكار"),
              surfaceTintColor: Colors.transparent,
              actions: [
                buildIconButton(iconData: Icons.search, onTap: () {}),
                buildIconButton(iconData: Icons.settings, onTap: () {}),
              ]),
          body: Padding(
              padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 10.h),
              child: ListView.builder(
                itemCount: azkarList.length,
                itemBuilder: (context, index) {
                  return BuildNokdemLkCategoryCard(
                    title: azkarList[index],
                    onPressed: () {
                      Navigator.pushNamed(context, '/azkarCard',
                          arguments: azkarList[index]);
                    },
                  );
                },
              ))),
    );
  }

  getAzkarContent() async {
    FileOperations fileOperations = FileOperations();
    String data =
        await fileOperations.getDataFromFile('assets/txt/azkar_names.txt');
    azkarList = data.split("\n");
    setState(() {});
  }

  Widget buildIconButton(
      {required IconData iconData, required void Function()? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
          color: MyColors.white, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          color: MyColors.green,
        ),
      ),
    );
  }
}
