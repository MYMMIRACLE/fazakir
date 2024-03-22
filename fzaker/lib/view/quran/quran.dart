import 'package:fazakir/core/helper/media_query.dart';
import 'package:fazakir/logic/surah_cubit/surah_cubit.dart';
import 'package:fazakir/view/quran/favorite.dart';
import 'package:fazakir/view/quran/juz.dart';
import 'package:fazakir/view/quran/surah/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/color.dart';
import '../widget/app_bar_bg.dart';
import '../widget/custom_text.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    BlocProvider.of<SurahCubit>(context).surahData();
  }

  @override
  void dispose() {
     tabController.dispose();
    super.dispose();
  }

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
                        "assets/image/quran.png",
                        color: MyColors.white,
                        width: 28.w,
                        height: 28.w,
                      ),
                      SizedBox(width: 12.w),
                      const CustomText(
                        "القرآن الكريم",
                        color: MyColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      buildIconButton(iconData: Icons.settings, onTap: () {}),
                      buildIconButton(iconData: Icons.search, onTap: () {}),
                    ],
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
                child: Column(
                  children: [
                    TabBar(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      dividerColor: MyColors.grey,
                      indicatorColor: MyColors.green,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: MyColors.grey,
                      labelColor: MyColors.green,
                      dividerHeight: 2.5.w,
                      labelStyle: TextStyle(
                          fontSize: 16.w,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w500),
                      controller: tabController,
                      tabs: const [
                        Tab(text: "السوره"),
                        Tab(text: 'الجزء'),
                        Tab(text: 'المفضلة'),
                      ],
                    ),
                    SizedBox(
                      //!remember
                      height: ScreenSize.height -
                          kToolbarHeight -
                          kBottomNavigationBarHeight -
                          190.w,
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          SurahScreen(),
                          JuzScreen(),
                          FavoriteScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(
      {required IconData iconData, required void Function()? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          color: MyColors.green,
          size: 20.w,
        ),
      ),
    );
  }
}
