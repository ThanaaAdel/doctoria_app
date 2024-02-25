
import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/media_query_helper.dart';
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


  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);

  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSignInPageVisited = false;
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
                      padding:  EdgeInsets.only(right: 5.w),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
              // White space
              verticalSpacing(50),
              // Button area
              InkWell(
                onTap: () {
                  if (_pageIndex < demoData.length - 1) {
                    // Navigate to the next page
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // Navigate to the sign-in page only if not already visited
                    if (!isSignInPageVisited) {
                      context.pushReplacementNamed('/signInScreen');
                      isSignInPageVisited = true;
                    }
                  }
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
             context.pushReplacementNamed('/signInScreen');
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
class OnBoardContent extends StatefulWidget {
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
  State<OnBoardContent> createState() => _OnBoardContentState();
}

class _OnBoardContentState extends State<OnBoardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(100),
        Image.asset(widget.image),
       verticalSpacing(15),
        Text(
          widget.title,
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

            widget.description,
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
        color: isActive ? ColorsManager.mainBlue
             : ColorsManager.grey.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}