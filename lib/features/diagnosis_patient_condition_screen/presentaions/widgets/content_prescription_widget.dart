import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class ContentPrescriptionWidget extends StatelessWidget {
  const ContentPrescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(S.of(context).treatment,style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.8))),
            Text("panadol",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.8))),
        ],),
        verticalSpacing(10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).note,
                style: TextStyles.font14Black500.copyWith(
                  color: ColorsManager.mainBlack.withOpacity(0.8),
                ),
              ),
              TextSpan(
                text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyles.font14Gray,
              ),
            ],
          ),
        ),


        verticalSpacing(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("How to use",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.8))),
            Text("Buccal",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.8))),
          ],),
        verticalSpacing(15),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              addNewWidget(context),
              Image.asset(ImageManager.prescriptionIcon),
            ]),
      ],),
    );
  }
  Container addNewWidget(BuildContext context) {
    return Container(
      height: 38.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: ColorsManager.mainBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(S.of(context).add_new,style: TextStyles.font14Blue500,),
          Icon(Icons.add,color: ColorsManager.mainBlue,size: 20.sp),
        ],),
    );
  }
}
