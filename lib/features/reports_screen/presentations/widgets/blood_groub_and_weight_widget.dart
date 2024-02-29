import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/row_label_and_any_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class BloodGroupAndWeightWidget extends StatelessWidget {
  const BloodGroupAndWeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              containerFromReportsSectionTwo(
                linkImg:   ImageManager.bloodGroupReportsImage,
                textDesc: S.of(context).blood_group,
                countFromText:  "A+",
              ),
              containerFromReportsSectionTwo(
                linkImg:   ImageManager.weightReportsImage,
                textDesc:S.of(context).weight_report,
                countFromText:  "80kg",
              ),
            ],
          ),

        ],
      ),
    );
  }
  Container containerFromReportsSectionTwo({required String linkImg, required  String textDesc, required  String countFromText,}) {
    return Container(
      width: 152.w,
      height: 153.h,
      decoration:  const BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorsManager.lightGrey,
          blurStyle: BlurStyle.outer,
          offset: Offset(2, 2),
          spreadRadius: 0,
          blurRadius: 8,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            linkImg,
          ),
          verticalSpacing(10),
          Text(textDesc),
          verticalSpacing(10),
          Text(
            countFromText,
            style: TextStyles.font20Blue600,
          ),
        ],
      ),
    );
  }

}
