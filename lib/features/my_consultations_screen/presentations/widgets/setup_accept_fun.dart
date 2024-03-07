import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependacy_injection.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/theming/image_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_cubit.dart';

void setupAcceptState(BuildContext context, String error,
    {required int bookingId, required String token}) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => getIt<BookingAcceptDetailsCubit>(),
      child: AlertDialog(
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyles.font14Blue500.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          AppTextButton(
            textStyle: TextStyles.font19White600,
            textButton: 'View',
            onPressed: () {
              context.read<BookingAcceptDetailsCubit>().emitBookingAcceptDetailsData(bookingId: bookingId, token: token,);
            },
          ),
        ],
        icon: Image.asset(
          ImageManager.successfullyImage,
          height: 100.h,
        ),
      ),
    ),
  );
}

