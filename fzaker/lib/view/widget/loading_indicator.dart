
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BuidLoadingIndicator extends StatelessWidget {
  const BuidLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
        animate: true,
        height: 180.h,
        width: 180.w,
        fit: BoxFit.scaleDown,
        "assets/animation/Animation - 1709122512677.json",
      
    );
  }
}
