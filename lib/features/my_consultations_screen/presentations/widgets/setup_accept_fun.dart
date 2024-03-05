import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/styles.dart';

void setupAcceptState(
    BuildContext context, String error, {VoidCallback? onPressed}) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: AlertDialog(
            content: Text(
              textAlign: TextAlign.center,
              error,
              style: TextStyles.font14Blue500
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            actions: [
              AppTextButton(
                textStyle: TextStyles.font19White600,
                textButton: 'View ',
                onPressed:onPressed,
              )
            ],
            icon: Image.asset(height: 100.h, ImageManager.successfullyImage),
          ),
        ),
      ],
    ),
  );
}
