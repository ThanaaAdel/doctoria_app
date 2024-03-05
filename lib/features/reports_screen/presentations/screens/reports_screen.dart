import '../../../../core/helper/extentions.dart';
import '../widgets/blood_groub_and_weight_widget.dart';
import '../widgets/heart_rate_widget.dart';
import '../widgets/latest_reports_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/shared_widgets/row_label_and_any_widget.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      children: [
        AppBarWidget(
          text: S
              .of(context)
              .reports,
        ),
        const HeartRateWidget(),
        const BloodGroupAndWeightWidget(),
        verticalSpacing(20),
        Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: RowLabelAndAnyWidget(text: S.of(context).latest_reports, theSecondWidget:
          TextButton(
            child: Text(     S.of(context).see_all,style: TextStyles.font14Blue500,),
            onPressed: (){
              context.pushNamed(Routes.reportsDetailsScreen);
            },
          ),
          ),),
        const LatestReportListView(),

      ],
    ));
  }
}
