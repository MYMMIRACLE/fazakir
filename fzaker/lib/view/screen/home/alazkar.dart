import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'nokdem_lk.dart';

class AlAzkarScreen extends StatelessWidget {
  const AlAzkarScreen({super.key});

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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 10.h),
              child: Column(
                children: [
                  BuildNokdemLkCategoryCard(
                      title: "أذكار الصباح", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار  المساء", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار قبل النوم", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار الاستيقاذ من النوم", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار ما بعد الصلاة", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار سماع الاذان", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "الاستخارة", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار بعد التشهد", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "الذكر قبل الوضوء", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "الذكر بعد انتهاء من الوضوء", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار الخروج  من المسجد", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار دخول من المسجد ", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "بعد الطعام و الشراب", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "قبل الطعام و الشراب", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار الدخول المنزل", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "أذكار الخروج من المنزل", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء استفتاح الصلاة", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء عند السجود", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء عند الركوع", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء السفر", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء لبس الثوب الجديد", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء لبس الثوب", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء الخروج من الخلاء", onPressed: () {}),
                  BuildNokdemLkCategoryCard(
                      title: "دعاء دخول الخلاء", onPressed: () {}),
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
          )),
    );
  }

  Widget buildIconButton(
      {required IconData iconData, required void Function()? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          color: Colors.green,
        ),
      ),
    );
  }
}
