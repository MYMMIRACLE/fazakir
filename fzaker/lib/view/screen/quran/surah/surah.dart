import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:fazakir/logic/surah_cubit/surah_cubit.dart';
import 'package:fazakir/view/widget/custom_text.dart';
import 'package:fazakir/view/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  ArabicNumbers arabicNumber = ArabicNumbers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(
            child: BuidLoadingIndicator(),
          );
        }
        if (state is SurahSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 24.w),
            itemCount: state.suraDataList.length,
            itemBuilder: (context, index) {
              final surah = state.suraDataList[index];
              return QuranDataCard(
                title: surah.suraName,
                subTitle: "الجزء: ${arabicNumber.convert(surah.para)}",
                leadingTitle:
                    "عدد الايات: ${arabicNumber.convert(surah.totalAyat)}",
                trailingTitle: surah.suraNo,
                onTap: () {
                  Navigator.pushNamed(context, "/moshaf");
                },
              );
            },
          );
        }
        return Container();
      },
    ));
  }
}

class QuranDataCard extends StatelessWidget {
  const QuranDataCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.leadingTitle,
      required this.trailingTitle,
      this.onTap});
  final String title;
  final String subTitle;
  final String leadingTitle;
  final String trailingTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: MyColors.green.withOpacity(0.1)),
              child: CustomText(
                trailingTitle,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4.w),
                CustomText(
                  subTitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const Spacer(),
            CustomText(
              leadingTitle,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: MyColors.grey,
            )
          ],
        ),
      ),
    );
  }
}
