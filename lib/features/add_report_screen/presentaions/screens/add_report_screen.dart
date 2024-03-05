import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/core/shared_widgets/app_text_feild.dart';
import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class AddReportScreen extends StatelessWidget {
  const AddReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [
      AppBarWidget(text: S.of(context).add_report),
      Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 20.h),
        child: Column(
          children: [
            AppTextFormField(
              maxLines: 10,
              borderRadius: 16.sp,
              textInputType: TextInputType.text,

              hintText: "Write a Report", validator: (p0) {

            },),
            verticalSpacing(20),
            AppTextButton(
                textStyle: TextStyles.font19White600,
                textButton: S.of(context).submit, onPressed: (){})
          ],
        ),
      )
    ]),);
  }
}
