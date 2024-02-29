import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../generated/l10n.dart';
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>   with SingleTickerProviderStateMixin  {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.mainWhite,
        title: Text(S.of(context).history),
        titleTextStyle: TextStyles.font18Black500,
      automaticallyImplyLeading: true,
        foregroundColor: ColorsManager.mainBlack,
        bottom:  TabBar(
         unselectedLabelStyle: TextStyles.font14Black500,
          unselectedLabelColor: ColorsManager.mainBlack,
          labelColor: ColorsManager.mainBlue,
          labelStyle: TextStyles.font14Blue500,
          indicatorSize:TabBarIndicatorSize.label ,
          indicatorPadding: EdgeInsets.only(left: 20.w,right: 20.w),
          indicatorWeight: 3.w,
          labelPadding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.w),
          // Adjust the horizontal padding

          tabs: const [
            Text("Upcoming"),
            Text("Complete"),
            Text("Cancelled"),
          ],
          controller: tabController,

        ),
      ),
        body:   TabBarView(
          controller: tabController,
          children: const [

            Center(child: Text("Upcpming"),),
            Center(child: Text("Upcpming"),),
            Center(child: Text("Upcpming"),),
          ],
        ),
      );


  }
}
