import 'package:fazakir/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class TextSpaceAndButton extends StatelessWidget {
  const TextSpaceAndButton({
    super.key,
    required this.title,
    this.buttonTitle,
    this.onTap,
    this.needBaseline = false,
    this.buttonColor = Colors.grey,
    this.widget,
  });
  final String title;
  final String? buttonTitle;
  final void Function()? onTap;
  final bool? needBaseline;
  final Color? buttonColor;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Row(
        children: [
          CustomText(title, fontSize: 16),
          const Spacer(),
          InkWell(
              onTap: onTap,
              child: widget ??
                  CustomText(
                    buttonTitle ?? "",
                    color: buttonColor ?? MyColors.grey,
                    needUnderline: needBaseline ?? false,
                  )),
        ],
      ),
    );
  }
}
