import '../../logic/sign_up/sign_up_cubit.dart';
import '../widgets/sign_up_text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/sign_up_bloc_listener.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(text: S.of(context).sign_up),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(children: [
              verticalSpacing(40),
              Image.asset(ImageManager.firstLetterFromDoctorIa),
              verticalSpacing(10),
              Text(S.of(context).text_sign_up,
                  style: TextStyles.font22Black600),
              verticalSpacing(20),
             const SignUpTextFormFields(),
              verticalSpacing(50),
              AppTextButton(
                  buttonHeight: 67.h,
                  textButton: S.of(context).continue_button,
                  onPressed: (){
                    validateThenDoSignUp(context);
                  },
                  textStyle: TextStyles.font19White600),
              const SignUpBlocListener(),
            ]),
          ),
        ],
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();

      setState(() {
        context.read<SignUpCubit>().phoneController.clear();
        context.read<SignUpCubit>().passwordController.clear();
        context.read<SignUpCubit>().confirmPasswordController.clear();
        context.read<SignUpCubit>().referCodeController.clear();
      });
    }
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
