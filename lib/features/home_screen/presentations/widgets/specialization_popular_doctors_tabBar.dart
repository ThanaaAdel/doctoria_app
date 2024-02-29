import '../../../../generated/l10n.dart';
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
    with  TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    context
        .read<SpecializationPopularDoctorsCubit>()
        .emitSpecializationPopularDoctors();
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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

  Padding successState(SpecializationPopularDoctorsModel specializationPopularDoctorsModel) {
    // Dynamically set the length of TabController based on data length
    tabController = TabController(length: specializationPopularDoctorsModel.data!.length, vsync: this);

    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.h,
            child: TabBar(
              isScrollable: true,
              indicatorWeight: 1,
              unselectedLabelColor: ColorsManager.mainBlue,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(horizontal: 8.h),
              tabs: [
                // Add a tab for "All"
                CustomTab(S.of(context).all),
                for (int i = 0; i < specializationPopularDoctorsModel.data!.length; i++)
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
                // Add a tab view for "All"
                if (specializationPopularDoctorsModel.data != null &&
                    specializationPopularDoctorsModel.data!.isNotEmpty)
                  allTabListView(specializationPopularDoctorsModel)
                else
                  const NotFoundWidget(),
                // Add tab views for each specialization
                for (int i = 0;
                i < specializationPopularDoctorsModel.data!.length;
                i++)
                  if (specializationPopularDoctorsModel
                      .data![i].limitPopularDoctors!.isNotEmpty)
                    tabsListView(specializationPopularDoctorsModel, i)
                  else
                    const NotFoundWidget(),
              ],
            ),
          ),
        ],
      ),
    );

  }

  ListView tabsListView(SpecializationPopularDoctorsModel specializationPopularDoctorsModel, int i) {
    return ListView.builder(
                    itemCount: specializationPopularDoctorsModel
                        .data![i].limitPopularDoctors!.length,
                    itemBuilder: (context, index) {
                      final doctor = specializationPopularDoctorsModel
                          .data![i].limitPopularDoctors![index];
                      return PopularDoctorListView(
                        imageLink: doctor.image.toString(),
                        name: doctor.name.toString(),
                        items: specializationPopularDoctorsModel
                            .data![i].limitPopularDoctors!.length,
                      );
                    },
                  );
  }

  ListView allTabListView(SpecializationPopularDoctorsModel specializationPopularDoctorsModel) {
    return ListView.builder(
                  itemCount: specializationPopularDoctorsModel.data!
                      .expand((data) => data.limitPopularDoctors ?? [])
                      .length,
                  itemBuilder: (context, index) {
                    final doctor = specializationPopularDoctorsModel
                        .data!
                        .expand((data) => data.limitPopularDoctors ?? [])
                        .elementAt(index);
                    return PopularDoctorListView(
                      imageLink: doctor.image.toString(),
                      name: doctor.name.toString(),
                      items: specializationPopularDoctorsModel
                          .data!
                          .expand((data) => data.limitPopularDoctors ?? [])
                          .length,
                    );
                  },
                );
  }
}
