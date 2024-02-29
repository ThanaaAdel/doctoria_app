import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        AppBarWidget(text: S.of(context).edit_profile),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40.sp,
                  child: Image.asset(ImageManager.profileImage),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(ImageManager.profileCamera)
                ),
              ],
            )


          ],
        )
      ]),
    );
  }
}
