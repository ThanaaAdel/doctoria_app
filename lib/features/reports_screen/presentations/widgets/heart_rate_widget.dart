import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class HeartRateWidget extends StatelessWidget {
  const HeartRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 20.h),
      height: 175.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ColorsManager.mainBlue.withOpacity(0.3),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             S.of(context).heart_rate,
              style: TextStyles.font14Black500,
            ),
            verticalSpacing(10),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '96',
                    style:
                    TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' bpm',
                    style: TextStyle(
                        fontSize: 16.sp, color: ColorsManager.mainBlack),
                  ),
                ],
              ),
            )
          ],
        ),
        Image.asset(ImageManager.paragraphReportImage),
      ]),
    );
  }
}
