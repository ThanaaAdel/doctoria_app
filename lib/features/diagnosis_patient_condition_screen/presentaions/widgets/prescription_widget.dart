import 'package:doctoria_app/core/shared_widgets/container_widget.dart';
import 'package:doctoria_app/core/theming/image_manager.dart';
import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
class PrescriptionWidget extends StatelessWidget {
  const PrescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).prescription, style: TextStyles.font18Black500,),
                 Image.asset(ImageManager.arrowDown),
              ]),
        ),
        height: context.screenHeight * 0.07);
  }

}