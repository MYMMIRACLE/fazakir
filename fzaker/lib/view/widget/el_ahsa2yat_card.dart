import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class ElahsayatCard extends StatelessWidget {
  const ElahsayatCard({
    super.key,
    required this.title,
    required this.counterTitle,
    this.onTap,
  });
  final String title;
  final dynamic counterTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72.w,
        width: 107.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.2, color: Colors.grey),
            color: MyColors.green.withOpacity(0.08)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(title,
                fontSize: 12,
                color: MyColors.grey,
                fontWeight: FontWeight.w500),
            CustomText(counterTitle.toString(),
                fontSize: 16,
                color: MyColors.green,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
