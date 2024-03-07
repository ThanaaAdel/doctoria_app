import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ConsultationAppBar extends StatelessWidget {
  const ConsultationAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.mainWhite,
      title: Text(S.of(context).my_consultations),
      titleTextStyle: TextStyles.font18Black500,
      automaticallyImplyLeading: true,
      foregroundColor: ColorsManager.mainBlack,
      bottom: TabBar(
        unselectedLabelStyle: TextStyles.font14Black500,
        unselectedLabelColor: ColorsManager.mainBlack,
        labelColor: ColorsManager.mainBlue,
        labelStyle: TextStyles.font14Blue500,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(left: 20.w, right: 20.w),
        indicatorWeight: 3.w,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
        tabs: [
          Text(S.of(context).all_consulting),
          Text(S.of(context).active),
          Text(S.of(context).complete),
        ],
        controller: tabController,
      ),
    );
  }
}