import 'package:doctoria_app/core/theming/media_query_helper.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/data/models/booking_acceptt_details_model/booking_accept_details_response_body_model.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_cubit.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/container_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../my_consultations_screen/presentations/widgets/setup_error_fun.dart';
class PhotoAndNameWidget extends StatefulWidget {
  const PhotoAndNameWidget({
    super.key, required this.bookingId, required this.token,
  });
final int bookingId;
final String token;
  @override
  State<PhotoAndNameWidget> createState() => _PhotoAndNameWidgetState();
}

class _PhotoAndNameWidgetState extends State<PhotoAndNameWidget> {
  @override
  void initState() {

    context.read<BookingAcceptDetailsCubit>().emitBookingAcceptDetailsData(bookingId: widget.bookingId, token: widget.token);
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingAcceptDetailsCubit,BookingAcceptDetailsStates>(
      listener: (context, state) {
        state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                ),
              );
            }, success: (bookingAcceptDetailsResponse) {
          final BookingAcceptDetailsResponseBody bookingAcceptDetailsResponseBody= bookingAcceptDetailsResponse;
          ContainerWidget(
            height: context.screenHeight*0.15,
            widget: Padding(
              padding:  EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.h,top: 15.h),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Image.asset(bookingAcceptDetailsResponseBody.data!.patient!.image.toString()),
                  horizontalSpacing(10),
                  Text(bookingAcceptDetailsResponseBody.data!.patient!.name.toString(),style: TextStyles.font18Black500,),
                ],
              ),
            ),
          );
        }, error: (error) {
          setupErrorState(context, error);
        });
      },

    );
  }
}