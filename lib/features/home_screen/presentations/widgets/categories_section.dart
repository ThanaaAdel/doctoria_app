import '../../../../core/theming/colors.dart';
import '../../../../core/theming/media_query_helper.dart';
import '../../../../core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.28,
      child: Column(
        children: [
        GridView(

          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2
          ),
            children: [
              categoryInfo(
                text:S.of(context).general_consultation,
                imageBaseUrl: ImageManager.generalConsultationIcon,
              ),
              categoryInfo(
                text:S.of(context).specialized_consultation,
                imageBaseUrl: ImageManager.specializedConsultationIcon,
              ),
              categoryInfo(
                text:S.of(context).medical_bag,
                imageBaseUrl: ImageManager.medicalBagIcon,
              ),
              categoryInfo(
                text:S.of(context).medical_file,
                imageBaseUrl: ImageManager.medicalFileIcon,
              ),
              categoryInfo(
                text:S.of(context).home_car,
                imageBaseUrl: ImageManager.homeCarIcon,
              ),
              categoryInfo(
                text:S.of(context).more,
                imageBaseUrl: ImageManager.moreIcon,
              ),
            ],
        ),
        ],
      ),
    );
  }

  Column categoryInfo({required String text, required String imageBaseUrl}) {
    return Column(
            children: [
          Container(
            padding: EdgeInsets.only(right: 13.w,left: 13.w,bottom: 13.w,top: 13.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: ColorsManager.mainBlue.withOpacity(0.3)),
            child: Center(child: Image.asset(imageBaseUrl,height: 22.h,width: 22.w,)),),
          verticalSpacing(10),
          Text(
            textAlign: TextAlign.center,
            text,style: TextStyles.font14Black500,)
        ]);
  }
}
