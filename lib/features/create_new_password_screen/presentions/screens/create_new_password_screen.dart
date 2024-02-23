import 'package:doctoria_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(text: S.of(context).create_new_password),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(children: [
                verticalSpacing(40),
                Image.asset(
                  ImageManager.createNewPasswordImage,
                  height: 200,
                ),
                verticalSpacing(20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).text_create_new_password_page,
                    style: TextStyles.font18Black500,
                  ),
                ),
                textFormFieldCreateNewPassword(context),
                AppTextButton(
                    buttonHeight: 70.h,
                    textButton: S.of(context).continue_button,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor:  ColorsManager.mainWhite,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 20.w,right: 20.w,bottom: 30.h,top: 30.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                              Image.asset(ImageManager.successfullyImage),
                              verticalSpacing(10),
                              Text(S.of(context).congratulations,style: TextStyles.font20Blue600,),
                              verticalSpacing(10),
                              Text(
                                textAlign: TextAlign.center,
                                S.of(context).text_congratulations,style: TextStyles.font14Black500.copyWith(color: ColorsManager.mainBlack.withOpacity(0.7)),),
                            ]),
                          ),
                        ),
                      );
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

  Column textFormFieldCreateNewPassword(BuildContext context) {
    return Column(
      children: [
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
        verticalSpacing(50),
      ],
    );
  }
}
