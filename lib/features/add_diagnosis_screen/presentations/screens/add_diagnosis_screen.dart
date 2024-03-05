import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/core/shared_widgets/app_text_feild.dart';
import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class AddDiagnosisScreen extends StatelessWidget {
  const AddDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [
      AppBarWidget(text: S.of(context).add_diagnosis),
      Padding(
        padding:  EdgeInsets.only(left: 20.w,bottom: 20.h,top: 20.h,right: 20.w),
        child: Column(
          children: [
            AppTextFormField(hintText: S.of(context).assessment, validator: (p0) {

            },),
    verticalSpacing(20),
            selectDiagnosisWidget(context),
            verticalSpacing(100),
            AppTextButton(
                textStyle: TextStyles.font19White600,
                textButton: S.of(context).submit, onPressed: (){})
          ],
        ),
      )

    ],),);
  }
  DropdownButtonFormField<String> selectDiagnosisWidget(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(Icons.keyboard_arrow_down_sharp),
      onChanged: (v) {},
      decoration: decorationFromTextField(),
      items: [
        DropdownMenuItem(
          value: "MALE",
          child: Text(
            S.of(context).male,
          ),
        ),
        DropdownMenuItem(
          value: "FEMALE",
          child: Text(
            S.of(context).female,
          ),
        ),
      ],
    );
  }
  InputDecoration decorationFromTextField() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.mainBlue,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8.0.sp)),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      hintText: "Select Diagnosis",
      hintStyle: TextStyles.font14Gray,
    );
  }
}
