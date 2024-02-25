import '../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(text: S.of(context).reset_password),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(children: [
                verticalSpacing(40),
                Image.asset(
                  ImageManager.resetPasswordImage,
                  height: 200,
                ),
                verticalSpacing(10),
                verticalSpacing(10),
                textFieldFromResetPassword(
                    decorationFromPhoneField, isPasswordVisible, context),
                verticalSpacing(50),
                AppTextButton(
                    buttonHeight: 67.h,
                    textButton: S.of(context).continue_button,
                    onPressed: () {
                      context.pushNamed('/verificationScreen');
                    },
                    textStyle: TextStyles.font19White600),
                verticalSpacing(10),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Column textFieldFromResetPassword(
      InputDecoration Function() decorationFromPhoneField,
      bool isPasswordVisible,
      BuildContext context) {
    return Column(
      children: [
        IntlPhoneField(
          decoration: decorationFromPhoneField(),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
        verticalSpacing(10),
        AppTextFormField(
          prefixIcon: Image.asset(ImageManager.smsIcon),
          textInputType: TextInputType.number,
          hintText: S.of(context).reset_via_sms,
          validator: (p0) {},
        ),
        verticalSpacing(20),
        AppTextFormField(
          prefixIcon: Image.asset(ImageManager.watsAppIcon),
          textInputType: TextInputType.number,
          hintText: S.of(context).reset_via_whatsapp,
          validator: (p0) {},
        ),
        verticalSpacing(20),
      ],
    );
  }

  InputDecoration decorationFromPhoneField() {
    return InputDecoration(
      labelText: S.of(context).phone_number,
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
          borderRadius: BorderRadius.circular(16.0.sp)),
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
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.lightGrey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
