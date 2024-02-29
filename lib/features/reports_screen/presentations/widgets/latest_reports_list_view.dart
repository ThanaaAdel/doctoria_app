import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class LatestReportListView extends StatelessWidget {
  const LatestReportListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h,bottom: 20.h),
      child: SizedBox(
        height: 300.h,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h,top: 10.h),
                child: Row(
                  children: [
                    Container(
                      height : 54.h,
                      width: 54.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.mainBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Image.asset(ImageManager.generalReportsIcons),
                    ),
                    horizontalSpacing(15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("General Healthy",style: TextStyles.font18Black500),
                        verticalSpacing(5),
                        Text(S.of(context).check_up,style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.5))),
                      ],),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("08:00",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.5))),
                  verticalSpacing(5),
                  Row(
                    children: [
                      Text("More",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlue)),
                      Icon(Icons.arrow_forward_ios_outlined,size: 14.sp,color: ColorsManager.mainBlack.withOpacity(0.5),)
                    ],
                  ),
                ],),
            ],
          ),),
      ),
    );
  }
}
