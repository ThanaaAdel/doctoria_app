import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/core/theming/spacing.dart';
import 'package:doctoria_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../generated/l10n.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.phoneNumber});
  final phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

late String otpCode;
bool isCodeCompleted = false;

class _VerificationScreenState extends State<VerificationScreen> {
  Widget _buildPinCodeFields(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h, bottom: 80.h),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          activeColor: ColorsManager.mainBlue,
          inactiveColor: ColorsManager.grey.withOpacity(0.5),
          inactiveFillColor: ColorsManager.mainWhite,
          selectedColor: ColorsManager.mainBlue,
          selectedFillColor: Colors.white,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(64),
          fieldHeight: 70.h,
          fieldWidth: 55.w,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        onCompleted: (code) {
          setState(() {
            otpCode = code;
            isCodeCompleted = true;
          });
          print("completed");
        },
        onChanged: (code) {
          setState(() {
            isCodeCompleted = false;
          });
        },
        cursorColor: Colors.black,
        enableActiveFill: true,
      ),
    );
  }

  Widget _buildIntoText() {
    return Column(
      children: [
        Text(
          S.of(context).text_verification_Screen,
          style: TextStyles.font24Black700,
        ),
        verticalSpacing(15),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: S.of(context).description_text_verification_screen,
            style: TextStyles.font18Black500.copyWith(fontSize: 16.sp),
            children: <TextSpan>[
              TextSpan(
                text: widget.phoneNumber,
                style: TextStyles.font18Black500.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarWidget(
                text: S.of(context).verification,
                widgetActions: TextButton(
                  onPressed: () {},
                  child: Text(S.of(context).change_number),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    verticalSpacing(30),
                    _buildIntoText(),
                    _buildPinCodeFields(context),
                    AppTextButton(
                      buttonHeight: 70.h,
                      textStyle: TextStyles.font19White600,
                      textButton: S.of(context).continue_button,
                      onPressed: isCodeCompleted ? () {
                        context.pushNamed('/createNewPassword');
                      } : null,
                      backgroundColor: isCodeCompleted
                          ? ColorsManager.mainBlue
                          : ColorsManager.grey,
                    ),

                    verticalSpacing(30),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend code",
                        style: TextStyles.font14Blue500.copyWith(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
