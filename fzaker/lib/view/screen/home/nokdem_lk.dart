import 'package:fazakir/core/helper/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../../widget/custom_text.dart';

class NokdemLkScreen extends StatelessWidget {
  const NokdemLkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("نقدم لك"),
              surfaceTintColor: Colors.transparent,
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 36.w,
                      width: 36.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.green.withOpacity(0.15)),
                      child: const Icon(Icons.search, color: Colors.green),
                    ),
                  ),
                ),
              ]),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 10.h),
                  child: Column(
                    children: [
                      BuildNokdemLkCategoryCard(
                          title: "الاذكار",
                          onPressed: () {
                            Navigator.pushNamed(context, "/azkar");
                          }),
                      BuildNokdemLkCategoryCard(
                          title: "التسبيح", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "التقويم", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "الأدعية", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "الورد اليومي", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "الاحاديث", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "سجل الصلوات", onPressed: () {}),
                      BuildNokdemLkCategoryCard(
                          title: "الشهادتين", onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class BuildNokdemLkCategoryCard extends StatelessWidget {
  const BuildNokdemLkCategoryCard({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 16.w),
        padding: EdgeInsets.all(8.w),
        height: 64.h,
        width: ScreenSize.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.1, color: Colors.grey)),
        child: Row(children: [
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyColors.green.withOpacity(0.15)),
            child: const Icon(
              Icons.headset_mic_outlined,
              color: MyColors.green,
            ),
          ),
          SizedBox(width: 12.w),
          CustomText(
            title,
            fontSize: 16,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: MyColors.green,
          )
        ]),
      ),
    );
  }
}
