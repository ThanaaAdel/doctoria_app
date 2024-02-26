import 'popular_doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../data/models/specialization_popular_doctors_model/specialization_popular_doctors_model.dart';
import '../../logic/cubits/specialization_popular_doctors_cubit/specialization_popular_doctors_cubit.dart';
import '../../logic/cubits/specialization_popular_doctors_cubit/specialization_popular_doctors_cubit_states.dart';
import 'custom_tab.dart';
import 'not_found_widget.dart';

class SpecializationPopularDoctorsTabBar extends StatefulWidget {
  const SpecializationPopularDoctorsTabBar({Key? key}) : super(key: key);

  @override
  State<SpecializationPopularDoctorsTabBar> createState() =>
      _SpecializationPopularDoctorsTabBarState();
}

class _SpecializationPopularDoctorsTabBarState
    extends State<SpecializationPopularDoctorsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    context
        .read<SpecializationPopularDoctorsCubit>()
        .emitSpecializationPopularDoctors();
    //tabController = TabController(length: specializationPopularDoctorsModel.data!.length + 1, vsync: this);
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationPopularDoctorsCubit,
        SpecializationPopularDoctorsCubitStates>(builder: (context, state) {
      return state.when(
        initial: () {
          return const Center(
              child: CircularProgressIndicator(color: ColorsManager.mainBlue));
        },
        loading: () {
          return const Center(
              child: CircularProgressIndicator(color: ColorsManager.mainBlue));
        },
        success: (data) {
          final SpecializationPopularDoctorsModel
              specializationPopularDoctorsModel = data;
          return successState(specializationPopularDoctorsModel);
        },
        error: (error) {
          return Center(child: Text(error));
        },
      );
    });
  }

  Padding successState(
      SpecializationPopularDoctorsModel specializationPopularDoctorsModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 33.h, // Set the desired height for the TabBar
            child: TabBar(
              isScrollable: false,
              indicatorWeight: 1,
              unselectedLabelColor: ColorsManager.mainBlue,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(horizontal: 8.h),
              // Adjust the horizontal padding

              tabs: [
                for (int i = 0;
                    i < specializationPopularDoctorsModel.data!.length;
                    i++)
                  CustomTab(specializationPopularDoctorsModel.data![i].name!),
              ],
              controller: tabController,
              indicator: BoxDecoration(
                color: ColorsManager.mainBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              for (int i = 0;
                  i < specializationPopularDoctorsModel.data!.length;
                  i++)
                if (specializationPopularDoctorsModel
                    .data![i].limitPopularDoctors!.isNotEmpty)
                  ...specializationPopularDoctorsModel
                      .data![i].limitPopularDoctors!
                      .map((doctor) => PopularDoctorListView(
                            imageLink: doctor.image.toString(),
                            name: doctor.name.toString(),
                            items: specializationPopularDoctorsModel
                                .data![i].limitPopularDoctors!.length,
                          ))
                else
                const NotFoundWidget()
            ],
          )),
        ],
      ),
    );
  }
}


