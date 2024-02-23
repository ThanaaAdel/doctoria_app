import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import 'package:doctoria_app/features/sign_in_screen/presentaions/widgets/login_bloc_listener.dart';
import 'package:doctoria_app/features/sign_in_screen/presentaions/widgets/phone_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  late String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(text: S.of(context).sign_in),
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(40),
                  Image.asset(ImageManager.firstLetterFromDoctorIa),
                  verticalSpacing(20),
                  Text(S.of(context).text_sign_in, style: TextStyles.font22Black600),
                  verticalSpacing(40),
                  phoneAndPasswordTextFieldSignIn(),
                  verticalSpacing(20),
                  AppTextButton(
                      buttonHeight: 67.h,
                      textButton: S.of(context).sign_in,onPressed: (){
                    validateThenDoLogin(context);
                  },textStyle: TextStyles.font19White600),
                  verticalSpacing(80),
                  doNotHaveAccount(context),
                  const SignInBlocListener(),
                ]),
            ),
          ),
        ],
      )
    );

  }
  void validateThenDoLogin(BuildContext context){
    if(context.read<SignInCubit>().formKey.currentState!.validate()){
      context.read<SignInCubit>().emitSignInStates();

      setState(() {
        context.read<SignInCubit>().phoneController.clear();
        context.read<SignInCubit>().passwordController.clear();
      });
    }
  }
  Padding doNotHaveAccount(BuildContext context) {
    return Padding(
                  padding:  EdgeInsets.only(bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                    S.of(context).do_not_have_account,
                    style: TextStyle(
                      color: ColorsManager.grey, // Gray color
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                    InkWell(
                      onTap: () {
                        context.pushNamed('/signUpScreen');
                      },
                      child: Text(
                        S.of(context).sign_up,
                        style: TextStyle(
                          color: ColorsManager.mainBlue, // Blue color
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),),
              ],),
                );
  }
  Column phoneAndPasswordTextFieldSignIn() {
    return Column(
      children: [
        const PhoneAndPassword(),
        verticalSpacing(20),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            S.of(context).forget_password,
            style: TextStyles.font14Blue500,
          ),
        ),
      ],
    );
  }


}
