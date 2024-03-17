import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class NokdemLakCard extends StatelessWidget {
  const NokdemLakCard({
    super.key,
    this.onTap,
    required this.title,
    this.isFrist = false,
  });
  final void Function()? onTap;
  final String title;
  final bool? isFrist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: isFrist == true ? 0 : 12.w),
        height: 106.w,
        width: 72.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.3, color: Colors.green)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.green.withOpacity(0.15)),
              child: const Text(
                "...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
            ),
            CustomText(
              title,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
