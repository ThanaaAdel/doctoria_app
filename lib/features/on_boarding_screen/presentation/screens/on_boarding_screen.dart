// ignore_for_file: avoid_print, must_be_immutable

import 'dart:async';
import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}



// OnBoardingScreen
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // Variables
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // OnBoarding content list
    final List<OnBoard> demoData = [
      OnBoard(
        image: ImageManager.onboardingScreen1Image,
        title: S.of(context).find_a_doctor,
        description:S.of(context).intro_screen1,
      ),
      OnBoard(
        image: ImageManager.onboardingScreen2Image,
        title: S.of(context).choose_a_doctor,
        description:S.of(context).intro_screen2,
      ),
      OnBoard(
        image:ImageManager.onboardingScreen3Image,
        title: S.of(context).book_your_date,
        description:S.of(context).intro_screen3,
      ),

    ];
    return Scaffold(
      body: Stack(children: [

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // Background gradient
          decoration: const BoxDecoration(
              color: ColorsManager.mainWhite
          ),
          child: Column(
            children: [
              // Carousel area
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: demoData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnBoardContent(
                    title: demoData[index].title,
                    description: demoData[index].description,
                    image: demoData[index].image,
                  ),
                ),
              ),
              // Indicator area
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
              // White space
              verticalSpacing(120),
              // Button area
              InkWell(
                onTap: () {
                  print("Button clicked!");
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  height: context.screenHeight * 0.075,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                    child: Text(
                      _pageIndex == demoData.length - 1
                          ? S.of(context).start_now
                          : S.of(context).next,
                      style:  TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 50.0.h,
          right: 40.0.w,
          child: GestureDetector(
            onTap: () {
              // Handle skip action
              print("Skip clicked!");
            },
            child: Text(
              S.of(context).skip,
              style: TextStyle(
                fontSize: 16.sp,
                color: ColorsManager.mainBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

      ],),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(100),
        Image.asset(image),
       verticalSpacing(15),
        Text(
          title,
          style: const TextStyle(
            color: ColorsManager.mainBlack,
            fontSize: 23,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpacing(16.h),
        Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: Text(

            description,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontFamily: "Poppins",
              color: ColorsManager.grey.withOpacity(0.6),
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
        color: isActive ? ColorsManager.mainBlue : ColorsManager.grey.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}