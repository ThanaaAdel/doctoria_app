import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.imageLink, required this.doctorName, required this.doctorId});
  final String imageLink;
  final String doctorName;
  final int doctorId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.doctorDetailsScreen,arguments: doctorId);
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h,top: 20.h),
        width: double.infinity,
        child: Row(
          children: [
            Image.network(
                width: 100.w,
                height: 100.h,
                imageLink),
            horizontalSpacing(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(doctorName,style: TextStyles.font18Black500,),
                    horizontalSpacing(30),
                    Image.asset(ImageManager.coloredHeartIcon),
                  ],),
                const Divider(
                  thickness: 1,
                  color: Color(0xff818181),
                ),
                verticalSpacing(5),
                Text("Dentist in Elgabry hospital",style: TextStyles.font14Gray,),
                verticalSpacing(10),
                Row(
                  children: [
                    Row(children: [
                      Icon(Icons.star,color: ColorsManager.mainBlue,size: 16.sp,),
                      horizontalSpacing(5),
                      Text("4.8",style: TextStyles.font14Black500,),
                      horizontalSpacing(20),
                      Text("(4250 reviews)",style: TextStyles.font14Gray,),
                    ],)
                  ],
                )
              ],)
          ],
        ),),
    );
  }
}