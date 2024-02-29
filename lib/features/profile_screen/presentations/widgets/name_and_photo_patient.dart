import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';

class NameAndPhotoPatientWidget extends StatelessWidget {
  const NameAndPhotoPatientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 20.h),
      child: Row(children: [
        CircleAvatar(
          radius: 30.sp,
          foregroundColor: ColorsManager.mainBlue,
          child: Image.asset(ImageManager.profileImage),
        ),
        horizontalSpacing(10),
        Column( children: [
          Text("Ahmed Aziz",style: TextStyles.font18Black500),
          verticalSpacing(5),
          Text("01056845230",style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.5))),
        ],)
      ],),
    );
  }
}
