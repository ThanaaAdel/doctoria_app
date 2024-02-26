import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
        child: ListView(
          children: [
            Image.asset(ImageManager.notFoundIcon),
            Text("Not Found",
                style: TextStyles.font20Black600,
                textAlign: TextAlign.center),
            verticalSpacing(5),
            Text(
              "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
              textAlign: TextAlign.center,
              style: TextStyles.font14Black500.copyWith(
                color: ColorsManager.mainBlack.withOpacity(0.7),
              ),
            ),
          ],
        ));
  }
}