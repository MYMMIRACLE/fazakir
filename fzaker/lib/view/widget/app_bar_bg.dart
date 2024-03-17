
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';
import '../../core/helper/media_query.dart';

class AppBarBackground extends StatelessWidget {
  const AppBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.w),
                      bottomRight: Radius.circular(12.w),
                    ),
                    child: Container(
                      width: ScreenSize.width,
                      height: 165.w,
                      color: MyColors.green.withOpacity(0.6),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Image.asset(
                              "assets/image/app_bar.png",
                              width: ScreenSize.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            left: -100.w,
                            bottom: 0,
                            child: Image.asset(
                              "assets/image/app_bar.png",
                              width: ScreenSize.width,
                              fit: BoxFit.fitWidth,
                              color: MyColors.green.withOpacity(0.6),
                            ),
                          ),
                          Positioned(
                            right: -100.w,
                            bottom: 0,
                            child: Image.asset(
                              "assets/image/app_bar.png",
                              width: ScreenSize.width,
                              fit: BoxFit.fitWidth,
                              color: MyColors.green.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}