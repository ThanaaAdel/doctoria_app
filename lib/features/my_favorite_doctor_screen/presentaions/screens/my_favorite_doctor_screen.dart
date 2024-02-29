import 'package:doctoria_app/features/my_favorite_doctor_screen/presentaions/widgets/no_doctor_founded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/doctor_list_view.dart';

class MyFavoriteDoctorScreen extends StatefulWidget {
  const MyFavoriteDoctorScreen({super.key});

  @override
  State<MyFavoriteDoctorScreen> createState() => _MyFavoriteDoctorScreenState();
}

class _MyFavoriteDoctorScreenState extends State<MyFavoriteDoctorScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.mainWhite,
        title: Text(S.of(context).my_favorite_doctor),
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
          tabs:  [
            Text(S.of(context).doctors),
            Text(S.of(context).laboratory),
            Text(S.of(context).radiology),
          ],
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          DoctorListView(categoryId: tabController.index + 1),
          NoDoctorFoundedWidget(),
          NoDoctorFoundedWidget(),
        ],
      ),
    );
  }
}
