import 'package:fazakir/logic/hadith_cubit/hadith_cubit.dart';
import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
import 'package:fazakir/logic/surah_cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constant/color.dart';
import 'account.dart';
import 'awkat_salah/awkat_salah.dart';
import 'home/home.dart';
import 'kepla.dart';
import 'quran/quran.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  final List<Widget> pages = [
    BlocProvider(
      create: (context) => HadithCubit(),
      child: const HomeScreen(),
    ), // 0
    const AwkatAlSalahScreen(), //1
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahCubit(),
        ),
        BlocProvider(
          create: (context) => QuranCubit(),
        ),
      ],
      child: const QuranScreen(),
    ), // 2
    const AlKeplaScreen(), // 3
    const AccountScreen(), // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Material(
            elevation: 0,
            color: Colors.grey[100],
            shadowColor: Colors.grey,
            child: Container(
              height: 70.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 5,
                      color: MyColors.grey.withOpacity(0.2))
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  selectedLabelStyle:
                      TextStyle(fontSize: 14.sp, fontFamily: 'cairo'),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 12.sp, fontFamily: 'cairo'),
                  elevation: 0,
                  enableFeedback: true,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: MyColors.green,
                  unselectedItemColor: MyColors.grey,
                  backgroundColor: MyColors.white,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon:
                          buildIcon("assets/image/home.png", currentIndex == 0),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(
                          "assets/image/salah.png", currentIndex == 1),
                      label: 'اوقات الصلاة',
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(
                          "assets/image/quran.png", currentIndex == 2),
                      label: 'المصحف',
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(
                          "assets/image/kepla.png", currentIndex == 3),
                      label: 'القبلة',
                    ),
                    BottomNavigationBarItem(
                      icon:
                          buildIcon("assets/image/acc.png", currentIndex == 4),
                      label: 'حسابي',
                    ),
                  ],
                ),
              ),
            )),
        backgroundColor: MyColors.white,
        body: pages.elementAt(currentIndex),
      ),
    );
  }

  Widget buildIcon(String imagePath, bool isSelected) {
    return ColorFiltered(
      colorFilter: isSelected
          ? const ColorFilter.mode(MyColors.green, BlendMode.srcIn)
          : const ColorFilter.mode(MyColors.grey, BlendMode.srcIn),
      child: Image.asset(
        imagePath,
        width: 24.w,
        height: 24.w,
      ),
    );
  }
}
