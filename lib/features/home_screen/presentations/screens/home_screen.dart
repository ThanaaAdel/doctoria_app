import '../../../../core/theming/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/row_label_and_any_widget.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/appbar_home_widget.dart';
import '../widgets/categories_section.dart';
import '../widgets/slider_home_screen_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarHomeWidget(),
              const SliderHomeScreenList(),
              RowLabelAndAnyWidget(
                text: S.of(context).category,
                theSecondWidget: TextButton(
                    onPressed: () {}, child: Text(S.of(context).see_all,style: TextStyles.font14Blue500,)),
              ),
              verticalSpacing(5),
              const CategoriesSection(),
              RowLabelAndAnyWidget(
                text: S.of(context).popular_doctors,
                theSecondWidget: TextButton(
                    onPressed: () {}, child: Text(S.of(context).see_all,style: TextStyles.font14Blue500,)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
