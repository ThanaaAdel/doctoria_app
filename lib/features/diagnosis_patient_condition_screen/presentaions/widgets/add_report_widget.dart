import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:doctoria_app/core/shared_widgets/container_widget.dart';
import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class AddReportWidget extends StatelessWidget {
  const AddReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        widget:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text("Add Report",style: TextStyles.font18Black500,),
            addWidget(context)
          ]),
        ),
        height: context.screenHeight*0.08);
  }

  GestureDetector addWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.addReportScreen);
      },
      child: Container(
            height: 32.h,
            width: 77.w,
            decoration: BoxDecoration(
                color: ColorsManager.mainBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(S.of(context).all,style: TextStyles.font14Blue500,),
              Icon(Icons.add,color: ColorsManager.mainBlue,size: 20.sp),
            ],),
          ),
    );
  }
}
