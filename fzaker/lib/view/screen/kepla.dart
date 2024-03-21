import 'package:fazakir/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';
import '../../core/helper/media_query.dart';

class AlKeplaScreen extends StatelessWidget {
  const AlKeplaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
                children: [
          Stack(
            children: [
              Image.asset(
                "assets/image/mosque_app_bar.png",
                width: ScreenSize.width,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: ScreenSize.height * 0.144),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/image/kepla.png",
                      color: MyColors.white,
                       width: 28.w,
                        height: 28.w,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "القبلة",
                      style: TextStyle(fontSize: 20.sp, color: MyColors.white),
                    ),
                    const Spacer(),
                    buildIconButton(iconData: Icons.edit, onTap: () {}),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(
                    height: ScreenSize.height / 1.775,
                    child: const Icon(
                      Icons.compass_calibration_outlined,
                      size: 100,
                      color: MyColors.green,
                    )),
                const Text(
                  "يرجي السماح بالوصول لموقعك لاستخدام بوصلة القبلة",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  title: "تمكن",
                  onPressed: () {},
                )
              ],
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
