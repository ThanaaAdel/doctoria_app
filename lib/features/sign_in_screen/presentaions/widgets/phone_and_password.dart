import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../generated/l10n.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _PhoneAndPasswordState();
}

class _PhoneAndPasswordState extends State<PhoneAndPassword> {
  bool isPasswordVisible = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignInCubit>().passwordController;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignInCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller:  context.read<SignInCubit>().phoneController,
              contentPadding: EdgeInsets.only(top: 25.h, bottom: 25.h,right: 22.w,left: 22.w),
              textInputType: TextInputType.number,
              hintText: S.of(context).phone_number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid phone';
                }
              },
            ),
            // IntlPhoneField(
            //   controller:  context.read<SignInCubit>().phoneController,
            //   decoration: decorationFromPhoneField(),
            //   initialCountryCode: 'IN',
            //
            //   onChanged: (phone) {
            //     print(phone.completeNumber);
            //   },
            // ),
            verticalSpacing(20),
            AppTextFormField(
              controller:  context.read<SignInCubit>().passwordController,
              contentPadding: EdgeInsets.only(top: 25.h, bottom: 25.h),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            verticalSpacing(24),
          ],
        ));
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
