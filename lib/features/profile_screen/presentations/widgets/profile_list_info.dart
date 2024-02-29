import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class ProfileListInformation extends StatelessWidget {
  const ProfileListInformation({super.key, required this.iconUrl, required this.textDesc, required this.onPressed});
 final String iconUrl;
 final String textDesc;
 final  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w,right: 25.w,top: 20.h,bottom: 20.h),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconUrl),
              horizontalSpacing(10),
              Text(textDesc,style: TextStyles.font14Black500),
            ],
          ),
        GestureDetector(
          onTap:() => onPressed(),
          child:   Image.asset(ImageManager.arrowIcon,width: 24.w,height: 24.h),
        )
        ],),
    );
  }
}
