import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int index;
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset(
                  'assets/images/OnBoardingScreen1.png',
                ),
              ),

              const Text(
                'Find a doctor',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,

                    color: Color(0xff212121)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You can search for a doctor by specialty and the location you are in',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset(
                  'assets/images/OnBoardingScreen2.png',
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Choose a Doctor',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Color(0xff212121)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20,),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'You can compare between doctors, according to the evaluation of other patients',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset(
                  'assets/images/OnBoardingScreen3.png',
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Book your date',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Color(0xff212121)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20,),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'After choosing the doctor that suits you, you can book your appointment online',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];
  SizedBox _nextButton({void Function(int)? setIndex}) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff246BFD),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              if (setIndex != null) {
                index = 2;
                setIndex(2);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox get _startNowButton {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff246BFD),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                'Start now',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 45.0),
                  child: CustomIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                      activeIndicator: ActiveIndicator(
                          color: const Color(0xff246BFD).withOpacity(0.5)),
                      closedIndicator:
                          const ClosedIndicator(color: Color(0xff246BFD)),

                      indicatorDesign: IndicatorDesign.polygon(
                        polygonDesign: PolygonDesign(
                          polygonRadius: 6.0.sp,
                          polygon: DesignType.polygon_circle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                index != pagesLength - 1
                    ? _nextButton(setIndex: setIndex)
                    : _startNowButton,
              ],
            ),
          );
        },
      ),
    );
  }
}
