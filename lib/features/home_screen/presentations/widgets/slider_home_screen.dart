import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:doctoria_app/core/theming/styles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/image_manager.dart';

class SliderHomeScreen extends StatelessWidget {
  const SliderHomeScreen({super.key, required this.pageLength, required this.currentIndexPage});
 final int pageLength;
 final int currentIndexPage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.screenHeight * 0.04),
            color: ColorsManager.mainBlue,
          ),
          margin: EdgeInsets.symmetric(
              vertical: context.screenWidth * 0.01,
              horizontal: context.screenHeight * 0.01),
          width: context.screenWidth,
          height: context.screenHeight * .25,
          child: Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h,bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Medical Checks!", style: TextStyles.font20white600),
                verticalSpacing(10),
                Text(
                  " Check your health Condition\n regularly to minimize the\n incidence of disease in \n the future  ",
                  style: TextStyles.font12white400,
                ),
                verticalSpacing(12),
                SizedBox(
                  height: 27.h,
                  child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        backgroundColor:MaterialStateProperty.all(ColorsManager.mainWhite),),
                          // fixedSize: MaterialStateProperty.all(Size(80.w, 20.h),),),
                      child: Text( "Check now",style: TextStyles.font12blue400.copyWith(fontSize: 8),)),
                ),

              ],
            ),
          ),
        ),
        Positioned(
          right: 7.w,
          top: 5.h,
          child: Image.asset(
            ImageManager.imageHome,
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 160.w,
          child:   DotsIndicator(
          dotsCount: pageLength,
          position: currentIndexPage.toDouble(),
          decorator: DotsDecorator(
            spacing: EdgeInsets.only(left: 4.w,bottom: 10.h),
            activeColor: ColorsManager.mainWhite,
            size: const Size.square(6.0),
            activeSize: const Size(18.0, 6.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),)
      ],
    );
  }
}
