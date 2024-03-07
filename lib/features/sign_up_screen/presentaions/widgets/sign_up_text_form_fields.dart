import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../logic/sign_up/sign_up_cubit.dart';
class SignUpTextFormFields extends StatefulWidget {
  const SignUpTextFormFields({super.key});

  @override
  State<SignUpTextFormFields> createState() => _SignUpTextFormFieldsState();
}

class _SignUpTextFormFieldsState extends State<SignUpTextFormFields> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formKey,
        child:  Column(
      children: [
        AppTextFormField(
          controller: context.read<SignUpCubit>().phoneController,
          contentPadding:
          EdgeInsets.only(top: 25.h, bottom: 25.h, right: 22.w, left: 22.w),
          textInputType: TextInputType.number,
          hintText: S.of(context).phone_number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid phone';
            }
          },
        ),
        // IntlPhoneField(
        //   decoration: decorationFromPhoneField(),
        //   initialCountryCode: 'IN',
        //   onChanged: (phone) {
        //     print(phone.completeNumber);
        //   },
        // ),
        verticalSpacing(10),
        AppTextFormField(
          maxLines: 1,
          controller: context.read<SignUpCubit>().passwordController,
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
          maxLines: 1,
          controller: context.read<SignUpCubit>().confirmPasswordController,
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
          controller: context.read<SignUpCubit>().referCodeController,
          hintText: S.of(context).referral_code,
          validator: (p0) {},
        ),
        verticalSpacing(20),
      ],
    ));
  }
}

