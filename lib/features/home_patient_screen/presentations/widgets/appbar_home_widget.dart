import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: const BoxDecoration(
        color: ColorsManager.mainWhite,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 218, 218, 218),
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              -15.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 10.w,right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset( ImageManager.doctoriaText,width: 150.w,),
            Image.asset(ImageManager.notificationIcon),
          ],
        ),
      ),
    );
  }
}
