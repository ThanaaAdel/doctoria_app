import '../../../../core/theming/colors.dart';
import '../../../../core/theming/media_query_helper.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/slider_model/slider_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/image_manager.dart';

class SliderHomeScreen extends StatelessWidget {
  const SliderHomeScreen({
    Key? key,
    required this.index,
    required this.sliderModel,
  }) : super(key: key);
  final int index;
  final SliderModel sliderModel;
  @override
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xff003EBD),
              const Color(0xff1356DE).withOpacity(0.9),
              const Color(0xff246BFD).withOpacity(0.9),
            ]),
            borderRadius: BorderRadius.circular(16),

          ),
          margin: EdgeInsets.symmetric(
              vertical: context.screenWidth * 0.01,
              horizontal: context.screenHeight * 0.01),
          width: context.screenWidth,
          height: context.screenHeight * .24,
          child: Padding(
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sliderModel.data![index].name.toString(),
                    style: TextStyles.font20white600),
                verticalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getLimitedWordsText(sliderModel.data![index].desc.toString(), 5),
                      style: TextStyles.font12white400,

                    ),
                    if (sliderModel.data![index].desc!.split(' ').length > 5)
                      Text(
                        sliderModel.data![index].desc!.split(' ').skip(5).join(' '),
                        style: TextStyles.font12white400,
                      ),
                  ],
                ),

                verticalSpacing(20),
                SizedBox(
                  height: 27.h,
                  width: 80.w,
                  child: TextButton(

                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                        backgroundColor:
                            MaterialStateProperty.all(ColorsManager.mainWhite),
                      ),

                      child: Text(
                        "Check now",
                        style: TextStyles.font12blue400.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          top: 15.h,
          child: Image.asset(
            ImageManager.imageHome,
          ),
        ),
        Positioned(
          bottom: 4.h,
          left: 160.w,
          child: DotsIndicator(
            dotsCount: sliderModel.data!.length,
            position: index.toDouble(),
            decorator: DotsDecorator(
              spacing: EdgeInsets.only(left: 4.w, bottom: 10.h),
              activeColor: ColorsManager.mainWhite,
              size: const Size.square(6.0),
              activeSize: const Size(15.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        )
      ],
    );

  }
  String _getLimitedWordsText(String input, int maxWords) {
    List<String> words = input.split(' ');
    int endIndex = words.length < maxWords ? words.length : maxWords;
    return words.sublist(0, endIndex).join(' ');
  }


}
