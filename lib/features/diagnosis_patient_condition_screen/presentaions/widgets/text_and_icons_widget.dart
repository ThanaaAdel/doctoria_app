import 'package:doctoria_app/core/shared_widgets/container_widget.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class TextAndIconsWidget extends StatelessWidget {
  const TextAndIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return     ContainerWidget(widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageManager.successYellowIcon),
          verticalSpacing(10),
          Text(S.of(context).booking_confirmed,style: TextStyles.font16Black500),
          verticalSpacing(10),
          iconsWidget()

        ]), height: context.screenHeight*0.28);
  }

  Row iconsWidget() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerFromIconWidget(
                backgroundColor: ColorsManager.mainWhite,
                borderColor: ColorsManager.mainWhite,
                imageLink: ImageManager.phoneIcon,
              ),
              containerFromIconWidget(
                backgroundColor: ColorsManager.mainWhite,
                borderColor: ColorsManager.mainBlue,
                imageLink: ImageManager.messageIcon,
              ),
              containerFromIconWidget(
                backgroundColor: ColorsManager.mainBlue,
                borderColor: ColorsManager.mainBlue,
                imageLink: ImageManager.videoIcon,
              ),
            ],);
  }
  BoxDecoration decorationFromContainer() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: ColorsManager.lightGrey,
            blurStyle: BlurStyle.outer,
            offset: Offset(2, 2),
            spreadRadius: 0,
            blurRadius: 8,
          )
        ]);
  }
  Container containerFromIconWidget({required String imageLink, required Color borderColor, required Color backgroundColor}) {

    return   Container(
      margin:    EdgeInsets.only(right: 10.w,left: 10.w),
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(8),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child:Image.asset(imageLink),);
  }
}
