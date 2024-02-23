import 'package:doctoria_app/core/helper/extentions.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;

   

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(text: S.of(context).sign_up),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                  children: [
                verticalSpacing(40),
                Image.asset(ImageManager.firstLetterFromDoctorIa),
                verticalSpacing(10),
                Text(S.of(context).text_sign_up, style: TextStyles.font22Black600),
                verticalSpacing(20),
                textFieldFromSignUp(decorationFromPhoneField, isPasswordVisible, context),
                verticalSpacing(50),
                    AppTextButton(
                    buttonHeight: 67.h,
                    textButton: S.of(context).continue_button,
                    onPressed: () {
                      context.pushNamed('/resetPasswordScreen');
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

  Column textFieldFromSignUp(InputDecoration Function() decorationFromPhoneField, bool isPasswordVisible, BuildContext context) {
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

              prefixIcon: Image.asset(ImageManager.lockImage),
              textInputType: TextInputType.visiblePassword,
              obscureText: !isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 22,
                ),
              ),
              hintText: S.of(context).password,
              validator: (p0) {},
            ),
            verticalSpacing(20),
            AppTextFormField(

              prefixIcon: Image.asset(ImageManager.lockImage),
              textInputType: TextInputType.visiblePassword,
              obscureText: !isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 22,
                ),
              ),
              hintText: S.of(context).confirm_password,
              validator: (p0) {},
            ),
            verticalSpacing(20),
            AppTextFormField(

              hintText: S.of(context).referral_code,
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
