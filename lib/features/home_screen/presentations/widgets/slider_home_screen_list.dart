
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:doctoria_app/features/home_screen/presentations/widgets/slider_home_screen.dart';
import 'package:flutter/material.dart';
class SliderHomeScreenList extends StatefulWidget {
  const SliderHomeScreenList({super.key});

  @override
  State<SliderHomeScreenList> createState() => _SliderHomeScreenListState();
}
int pageLength = 3; // Set the total number of pages
int currentIndexPage = 0;
class _SliderHomeScreenListState extends State<SliderHomeScreenList> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.02,
        left: context.screenWidth * 0.02,
      ),
      child: Column(
        children: [
          SizedBox(
            width: context.screenWidth * 0.94,
            height: context.screenHeight * 0.26,
            child: PageView.builder(
              itemCount: pageLength,
              onPageChanged: (index) {
                setState(() {
                  currentIndexPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Wrap(
                  runSpacing: context.screenHeight * 0.3,
                  direction: Axis.horizontal,
                  children: [0, 1, 2].map((index) {
                    return  SliderHomeScreen(
                      pageLength: pageLength,
                      currentIndexPage: currentIndexPage,
                    );
                  }).toList(),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}