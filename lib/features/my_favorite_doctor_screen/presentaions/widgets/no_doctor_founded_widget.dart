import 'package:doctoria_app/core/theming/image_manager.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:doctoria_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class NoDoctorFoundedWidget extends StatelessWidget {
  const NoDoctorFoundedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageManager.noDoctorFoundedImage),
        Text(
          S.of(context).no_found_doctors,
          style: TextStyles.font18Blue500,
        ),
        verticalSpacing(10),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Text(
            textAlign: TextAlign.center,
           S.of(context).text_from_no_found_doctors,
            style: TextStyles.font16gray500,
          ),
        ),
        verticalSpacing(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             S.of(context).go_to_doctors,
              style: TextStyles.font18Blue500,
            ),
            horizontalSpacing(10),
            Image.asset(ImageManager.arrowRight),
          ],
        )
      ],
    );
  }
}
