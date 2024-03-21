import 'package:fazakir/data/repository/hadith_data.dart';
import 'package:fazakir/logic/quran_cubit/quran_cubit.dart';
import 'package:fazakir/logic/tasbeeh_cubit/tasbeeh_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/media_query.dart';
import '../screen/home/azkar/alazkar.dart';
import '../screen/home/altsbeeh.dart';
import '../screen/home/azkar/azkar_card.dart';
import '../screen/home/nokdem_lk.dart';
import '../screen/nav_bar.dart';
import '../screen/splash.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    HadithRepository.fetchHadithData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return ScreenUtilInit(
      designSize: const Size(411.4, 867.4),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(builder: (_) {
        return BlocProvider(
          create: (context) => QuranCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            routes: {
              "/": (context) => const SplashScreen(),
              "/nav": (context) => const NavBarScreen(),
              "/nokdem": (context) => const NokdemLkScreen(),
              "/azkar": (context) => const AlAzkarScreen(),
              "/altsbeeh": (context) => BlocProvider(
                    create: (context) => TasbeehCubit(),
                    child: const AlTsbeehScreen(),
                  ),
              "/azkarCard": (context) => const AzkarCardScreen(),
              // "/moshaf": (context) => const MoshafScreen(),
            },
          ),
        );
      }),
    );
  }
}
