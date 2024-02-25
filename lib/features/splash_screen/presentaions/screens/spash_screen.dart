import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/theming/image_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      context.pushNamed('/onBoardingScreen');
    });
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              ColorsManager.colorSplash,
              BlendMode.hardLight,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageManager.splashImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: SizedBox(),
              ),
            ),
          ),
          Positioned(
            top: 300.h,
            bottom: 40.h,
            child: Padding(
              padding: EdgeInsets.only(right: 30.w, left: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageManager.textSplashImage),
                    ],
                  ),
                  LoadingAnimationWidget.hexagonDots(
                    color: ColorsManager.mainWhite,
                    size: 50.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


