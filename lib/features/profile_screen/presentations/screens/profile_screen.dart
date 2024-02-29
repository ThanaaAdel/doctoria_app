import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../generated/l10n.dart';
import '../widgets/name_and_photo_patient.dart';
import '../widgets/profile_list_info.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBarWidget(text:S.of(context).profile,),
        Column(
          children: [
            const NameAndPhotoPatientWidget(),
            ProfileListInformation(
              iconUrl: ImageManager.editProfileIcon,
              textDesc: S.of(context).edit_profile,
              onPressed: () => context.pushNamed(Routes.editProfileScreen),
            ),
            ProfileListInformation(
              iconUrl: ImageManager.medicalFileProfileIcon,
              textDesc: S.of(context).medical_file_profile,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.relativeIcon,
              textDesc: S.of(context).relatives,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.languageIcon,
              textDesc:S.of(context).language,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.privacyAndPolicyIcon,
              textDesc: S.of(context).privacy_and_policy,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.aboutUsIcon,
              textDesc:S.of(context).about_us,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.contactUsIcon,
              textDesc: S.of(context).contact_us,
              onPressed: () {

              },
            ),
        ],)
      ],
    );
  }
}


