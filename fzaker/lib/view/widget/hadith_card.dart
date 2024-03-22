import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';
import '../../core/helper/media_query.dart';
import '../home/home.dart';
import 'custom_text.dart';
import 'test_space_button.dart';

class HadithCard extends StatelessWidget {
  const HadithCard({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextSpaceAndButton(
            title: title,
            widget: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MyColors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4)),
              width: 30.w,
              height: 30.w,
              child: const Text("..."),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.w),
            width: ScreenSize.width,
            decoration: BoxDecoration(
                color: MyColors.green.withOpacity(0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1.1, color: Colors.grey)),
            child: CustomText(
              content,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            )),
      ],
    );
  }
}
