import 'package:fazakir/core/helper/media_query.dart';
import 'package:fazakir/logic/tasbeeh_cubit/tasbeeh_cubit.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class AlTsbeehScreen extends StatelessWidget {
  const AlTsbeehScreen({super.key});

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
          actions: [
            buildIconButton(
                iconData: Icons.replay_outlined,
                onTap: () {
                  BlocProvider.of<TasbeehCubit>(context).resetTasbeehCounter();
                }),
            buildIconButton(iconData: Icons.vibration, onTap: () {}),
            Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: buildIconButton(iconData: Icons.password, onTap: () {})),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: BlocBuilder<TasbeehCubit,TasbeehState>(builder: (context, state) {
            final cubit = BlocProvider.of<TasbeehCubit>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                CustomText(
                  cubit.tasbeehButtonLabel.toString(),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(flex: 2),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/image/counter.png",
                          width: ScreenSize.width / 1.56,
                          height: ScreenSize.width / 1.56,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            cubit.incrementTasbeehCounter();
                          },
                          child: CircleAvatar(
                              radius: 100.w,
                              backgroundColor: MyColors.green,
                              child: CustomText(
                                "${cubit.tasbeehCounter}/33\nالجولة: 01",
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
            );
          }),
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
