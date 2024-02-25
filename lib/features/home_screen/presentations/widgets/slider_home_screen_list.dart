import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/theming/media_query_helper.dart';
import 'slider_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../data/models/slider_model/slider_model.dart';
import '../../logic/cubits/slider_cubit.dart';
import '../../logic/cubits/slider_cubit_states.dart';

class SliderHomeScreenList extends StatefulWidget {
  const SliderHomeScreenList({super.key});

  @override
  State<SliderHomeScreenList> createState() => _SliderHomeScreenListState();
}

class _SliderHomeScreenListState extends State<SliderHomeScreenList> {
  @override
  void initState() {
    context.read<SliderCubit>().emitSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.02,
        left: context.screenWidth * 0.02,
      ),
      child: Column(
        children: [
          BlocBuilder<SliderCubit, SliderCubitStates>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: ColorsManager.colorSplash));
                },
                loading: () {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: ColorsManager.colorSplash));
                },
                success: (data) {
                  final SliderModel sliderModel = data;

                  return SizedBox(
                      width: context.screenWidth * 0.94,
                      height: context.screenHeight * 0.26,
                      child: CarouselSlider(
                        items: [
                          for (int index = 0; index < sliderModel.data!.length; index++)
                            SliderHomeScreen(
                              index: index,
                              sliderModel: sliderModel,
                            ),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          // Set the desired options for the carousel
                          height: 200, // Set the height of the carousel
                          autoPlay: false, // Enable auto-play
                          autoPlayCurve:
                              Curves.easeInOut, // Set the auto-play curve
                          autoPlayAnimationDuration: const Duration(
                              milliseconds:
                                  500), // Set the auto-play animation duration
                          aspectRatio:
                              16 / 9, // Set the aspect ratio of each item
                          // You can also customize other options such as enlargeCenterPage, enableInfiniteScroll, etc.
                        ),
                      ));
                },
                error: (error) {
                  return Center(child: Text(error));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
