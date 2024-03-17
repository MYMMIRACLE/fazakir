import 'package:fazakir/core/helper/media_query.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class AlTsbeehScreen extends StatefulWidget {
  const AlTsbeehScreen({super.key});

  @override
  State<AlTsbeehScreen> createState() => _AlTsbeehScreenState();
}

class _AlTsbeehScreenState extends State<AlTsbeehScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            "التسبيح",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          //  Text(
          //   "التسبيح",
          //   style: TextStyle(fontSize: 20.sp),
          // ),
          actions: [
            buildIconButton(
                iconData: Icons.replay_outlined,
                onTap: () {
                  counter = 0;
                  setState(() {});
                }),
            buildIconButton(iconData: Icons.vibration, onTap: () {}),
            Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: buildIconButton(iconData: Icons.password, onTap: () {})),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/image/counter.png",
                        width:ScreenSize.width/1.56,
                        height: ScreenSize.width/1.56,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (counter < 33) {
                            counter++;
                            setState(() {});
                          }
                        },
                        child: CircleAvatar(
                            radius: 100.w,
                            backgroundColor: MyColors.green,
                            child: CustomText(
                              "$counter/33\nالجولة: 01",
                              textAlign: TextAlign.center,
                              fontSize: 24,
                              color: MyColors.white,
                              fontWeight: FontWeight.w500,
                            )
                            //  Text(
                            //   "$counter/33\nالجولة: 01",
                            //   textAlign: TextAlign.center,
                            //   style:
                            //       TextStyle(color: Colors.white, fontSize: 24.sp),
                            // ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Row(
                  children: [
                    buildIconButton(
                        iconData: Icons.mode_edit_outline_outlined,
                        onTap: () {},
                        scale: 48),
                    const Spacer(),
                    buildIconButton(
                        iconData: Icons.play_arrow, onTap: () {}, scale: 48),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(
      {required IconData iconData,
      required void Function()? onTap,
      double? scale}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: scale?.w ?? 36.w,
      height: scale?.w ?? 36.w,
      decoration: BoxDecoration(
          color: MyColors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4)),
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
