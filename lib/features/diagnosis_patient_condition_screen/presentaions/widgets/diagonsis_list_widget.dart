import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:doctoria_app/core/shared_widgets/app_text_feild.dart';
import 'package:doctoria_app/core/shared_widgets/container_widget.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class DiagnosisListWidget extends StatelessWidget {
  const DiagnosisListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        widget:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) =>Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: "A21.3 Gastrointestinal Tularemia",
                      validator: (p0) {},
                    ),
                  ),
                  horizontalSpacing(5),
                  Icon(Icons.delete, color: Colors.red, size: 30.sp),
                ],
              ) ,

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: addNewWidget(context)),),],),
        ),
        height: context.screenHeight*0.28);
  }
  GestureDetector addNewWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
context.pushNamed(Routes.addDiagnosisScreen);
      },
      child: Container(
        height: 38.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: ColorsManager.mainBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.of(context).add_new,style: TextStyles.font14Blue500,),
            Icon(Icons.add,color: ColorsManager.mainBlue,size: 20.sp),
          ],),
      ),
    );
  }
}
