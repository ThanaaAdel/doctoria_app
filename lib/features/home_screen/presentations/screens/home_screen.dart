import '../../../../core/theming/media_query_helper.dart';
import '../../../../core/theming/spacing.dart';

import '../../logic/cubits/slider_cubit/slider_cubit.dart';
import '../../logic/cubits/specialization_popular_doctors_cubit/specialization_popular_doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependacy_injection.dart';
import '../../../../core/shared_widgets/row_label_and_any_widget.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/appbar_home_widget.dart';
import '../widgets/categories_section.dart';
import '../widgets/slider_home_screen_list.dart';
import '../widgets/specialization_popular_doctors_tabBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AppBarHomeWidget(),
        BlocProvider(
          create: (context) => getIt<SliderCubit>(),
          child: const SliderHomeScreenList(),
        ),
        RowLabelAndAnyWidget(
          text: S.of(context).category,
          theSecondWidget: TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).see_all,
                style: TextStyles.font14Blue500,
              )),
        ),
        const CategoriesSection(),

        RowLabelAndAnyWidget(
          text: S.of(context).popular_doctors,
          theSecondWidget: TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).see_all,
                style: TextStyles.font14Blue500,
              )),
        ),
        BlocProvider(
          create: (context) => getIt<SpecializationPopularDoctorsCubit>(),
          child: SizedBox(
              height: context.screenHeight*0.3,
              child: const SpecializationPopularDoctorsTabBar()),
        ),
      ],
    );
  }
}
