import 'dart:async';

import 'package:fazakir/core/constant/color.dart';
import 'package:fazakir/core/helper/media_query.dart';
import 'package:fazakir/logic/hadith_cubit/hadith_cubit.dart';
import 'package:fazakir/view/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/app_bar_bg.dart';
import '../../widget/custom_text.dart';
import '../../widget/el_ahsa2yat_card.dart';
import '../../widget/hadith_card.dart';
import '../../widget/nodem_lak.dart';
import '../../widget/test_space_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HadithCubit>(context).getHadithData();
    //! scheduleFetchData();
  }

  // void scheduleFetchData() {
  //!   Timer.periodic(const Duration(hours: 24), (Timer timer) {
  //     BlocProvider.of<HadithCubit>(context).getHadithData();
  //   });
  // }
  double sliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const AppBarBackground(),
                Visibility(
                  visible: true,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                    margin:
                        EdgeInsets.only(right: 16.w, left: 16.w, top: 140.w),
                    width: ScreenSize.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 10,
                              color: Colors.grey.shade600.withOpacity(0.12))
                        ],
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(12.w)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CustomText("26 فبراير , 2024",
                                fontWeight: FontWeight.w500),
                            const Spacer(),
                            const CustomText(
                              "القاهرة",
                              fontWeight: FontWeight.w500,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              size: 22.w,
                              color: MyColors.green,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5.w,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 10.0.w,
                              elevation: 5,
                            ),
                          ),
                          child: Slider(
                            thumbColor: Colors.white,
                            inactiveColor: Colors.grey,
                            activeColor: MyColors.green,
                            allowedInteraction: SliderInteraction.slideOnly,
                            value: sliderValue,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                            },
                            min: 0.0,
                            max: 30.0,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: const CustomText(
                              "00:40:30 متبقية علي العصر",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildAwkatElSalahCard(
                                  title: "الفجر", time: "04:20"),
                              buildAwkatElSalahCard(
                                  title: "الشروق", time: "04:20"),
                              buildAwkatElSalahCard(
                                  title: "الظهر", time: "04:20"),
                              buildAwkatElSalahCard(
                                  title: "العصر", time: "04:20"),
                              buildAwkatElSalahCard(
                                  title: "المغرب", time: "04:20"),
                              buildAwkatElSalahCard(
                                  title: "العشاء", time: "04:20"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                TextSpaceAndButton(
                    onTap: () => Navigator.pushNamed(context, "/nokdem"),
                    needBaseline: true,
                    title: "نقدم لك",
                    buttonTitle: "عرض الكل"),
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NokdemLakCard(
                            title: "ألاذكار",
                            onTap: () {
                              Navigator.pushNamed(context, "/azkar");
                            },
                            isFrist: true),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                        NokdemLakCard(title: "ألاذكار", onTap: () {}),
                      ],
                    ),
                  ),
                ),
                TextSpaceAndButton(
                  onTap: () {},
                  title: "الأحصائيات",
                  buttonTitle: "أخر 7 ايام",
                  buttonColor: MyColors.green,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    El27sa2yatCard(
                      title: "التسبيح",
                      counterTitle: "0000",
                      onTap: () {
                        Navigator.pushNamed(context, "/altsbeeh");
                      },
                    ),
                    El27sa2yatCard(
                      title: "الصلاوات",
                      counterTitle: "0000",
                      onTap: () {},
                    ),
                    El27sa2yatCard(
                      title: "الاذكار",
                      counterTitle: "0000",
                      onTap: () {},
                    ),
                  ],
                ),
                BlocBuilder<HadithCubit, HadithState>(
                  builder: (context, state) {
                    if (state is HadithLoading) {
                      return const Center(
                        child: BuidLoadingIndicator(),
                      );
                    }
                    if (state is HadithSuccess) {
                      final hadith = state.hadithElYoum;
                      return Column(
                        children: [
                          HadithCard(
                              title: "حديث اليوم", content: hadith.hadithText),
                          HadithCard(
                              title: "دعاء اليوم", content: hadith.hadithText),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(height: 24.h)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildAwkatElSalahCard({required String title, required String time}) {
  return Column(
    children: [
      CustomText(title,
          fontSize: 12, color: MyColors.grey, fontWeight: FontWeight.w500),
      CustomText(time,
          fontSize: 14, color: MyColors.grey, fontWeight: FontWeight.w500),
    ],
  );
}
