import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/core/shared_widgets/app_text_feild.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
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
            verticalSpacing(40),
            imageFromThePatient(),
            textFormFieldEditProfile(context),
            verticalSpacing(20),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: AppTextButton(
                  textStyle: TextStyles.font20white600,
                  textButton: S.of(context).save,
                  onPressed: () {}),
            ),
          ],
        )
      ]),
    );
  }

  Padding textFormFieldEditProfile(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
      child: Column(
        children: [
          AppTextFormField(
            borderRadius: 8,
            contentPadding: const EdgeInsets.all(15),
            textInputType: TextInputType.text,
            hintText: "Ahmed",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          AppTextFormField(
            borderRadius: 8,
            contentPadding: const EdgeInsets.all(15),
            textInputType: TextInputType.text,
            hintText: "Aziz",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          AppTextFormField(
            borderRadius: 8,
            contentPadding: const EdgeInsets.all(15),
            textInputType: TextInputType.emailAddress,
            hintText: "admin@admin.com",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          AppTextFormField(
            borderRadius: 8,
            contentPadding: const EdgeInsets.all(15),
            textInputType: TextInputType.number,
            hintText: "0101080806854",
            validator: (p0) {},
          ),
          verticalSpacing(20),
          maleAndFemaleWidget(context),
          verticalSpacing(20),
          AppTextFormField(
            borderRadius: 8,
            suffixIcon: const Icon(Icons.arrow_forward_ios_outlined),
            contentPadding: const EdgeInsets.all(15),
            textInputType: TextInputType.text,
            hintText: S.of(context).password,
            validator: (p0) {},
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> maleAndFemaleWidget(BuildContext context) {
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
      hintText: "Genger",
      hintStyle: TextStyles.font14Gray,
    );
  }

  Stack imageFromThePatient() {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage(ImageManager.profileImage),
          radius: 40.sp,
        ),
        Positioned(
            top: -3,
            right: -5,
            child: Image.asset(
                height: 30.h, width: 30.w, ImageManager.profileCamera)),
      ],
    );
  }
}
