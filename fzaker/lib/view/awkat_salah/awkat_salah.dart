import 'dart:developer';

import 'package:fazakir/logic/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:fazakir/view/widget/app_bar_bg.dart';
import 'package:fazakir/view/widget/custom_button.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

import '../../core/helper/media_query.dart';
import '../../data/model/prayer_time.dart';

class AwkatAlSalahScreen extends StatefulWidget {
  const AwkatAlSalahScreen({super.key});

  @override
  State<AwkatAlSalahScreen> createState() => _AwkatAlSalahScreenState();
}

class _AwkatAlSalahScreenState extends State<AwkatAlSalahScreen> {
  PrayerTime? prayerTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              const AppBarBackground(),
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 110.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/image/salah.png",
                      color: MyColors.white,
                      width: 28.w,
                      height: 28.w,
                    ),
                    SizedBox(width: 12.w),
                    const Text(
                      "اوقات الصلاة",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Spacer(),
                    buildIconButton(
                        iconData: Icons.location_on_rounded, onTap: () {}),
                    buildIconButton(iconData: Icons.settings, onTap: () {}),
                    buildIconButton(iconData: Icons.search, onTap: () {}),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
              listener: (context, state) {
                if (state is PrayerTimeSuccess) {
                  prayerTime = state.prayerTimeData;
                }
              },
              builder: (context, state) {
                return Column(children: [
                  Container(
                      alignment: Alignment.center,
                      height: 200.h,
                      width: ScreenSize.width,
                      color: MyColors.grey.withOpacity(0.2),
                      child: Column(
                        children: [
                          CustomText(
                            "${prayerTime?.data[23].meta.timezone}",
                            fontSize: 28,
                          ),
                          CustomText(
                            "ميلادي ${prayerTime?.data[23].date.gregorian.date}",
                            fontSize: 28,
                          ),
                          CustomText(
                            "هجري ${prayerTime?.data[23].date.hijri.date}",
                            fontSize: 28,
                          ),
                        ],
                      )),
                  BuildAwkatSalahCard(
                      title: "الفجر",
                      time: "${prayerTime?.data[24].timings.fajr}"),
                  BuildAwkatSalahCard(
                      title: "الشروق",
                      time: "${prayerTime?.data[24].timings.sunrise}"),
                  BuildAwkatSalahCard(
                      title: "الظهر",
                      time: "${prayerTime?.data[24].timings.dhuhr}"),
                  BuildAwkatSalahCard(
                      title: "العصر",
                      time: "${prayerTime?.data[24].timings.asr}"),
                  BuildAwkatSalahCard(
                      title: "المغرب",
                      time: "${prayerTime?.data[24].timings.maghrib}"),
                  BuildAwkatSalahCard(
                      title: "العشاء",
                      time: "${prayerTime?.data[24].timings.isha}"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: CustomButton(
                      title: "فتح سجل الصلوات",
                      onPressed: () {},
                    ),
                  )
                ]);
              },
            ),
          )
        ],
      ),
    ));
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

class BuildAwkatSalahCard extends StatelessWidget {
  const BuildAwkatSalahCard({
    super.key,
    required this.title,
    this.onPressed,
    required this.time,
  });
  final String title;
  final String time;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(8.w),
      height: 64.h,
      width: ScreenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.1, color: MyColors.grey)),
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
        Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
        const Spacer(),
        Text(
          time,
          style: TextStyle(fontSize: 14.sp),
        ),
        Container(
          margin: EdgeInsets.only(right: 12.w),
          height: 48.w,
          width: 48.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColors.green.withOpacity(0.15)),
          child: const Icon(
            Icons.alarm_rounded,
            color: MyColors.green,
          ),
        ),
      ]),
    );
  }
}
