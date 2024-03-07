import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/container_widget.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';

class PhotoAndNameWidget extends StatelessWidget {
  const PhotoAndNameWidget({
    super.key, required this.name, required this.image
  });


final String name,image;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: context.screenHeight * 0.15,
      widget: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(image),
            horizontalSpacing(10),
            Text(name, style: TextStyles.font18Black500),
          ],
        ),
      ),
    );
  }
}

