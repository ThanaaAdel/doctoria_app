import 'package:doctoria_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doctoria_app/features/my_consultations_screen/data/models/booking_accept_model/booking_accept_model.dart';
import 'package:doctoria_app/features/my_consultations_screen/logic/booking_accept_cubit/booking_accept_cubit.dart';
import 'package:doctoria_app/features/my_consultations_screen/logic/booking_accept_cubit/booking_accept_states.dart';
import 'package:doctoria_app/features/my_consultations_screen/presentations/widgets/setup_accept_fun.dart';
import 'package:doctoria_app/features/my_consultations_screen/presentations/widgets/setup_error_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class BookingListViewWidget extends StatefulWidget {
  const BookingListViewWidget({
    Key? key,
    required this.imageLink, required this.status, required this.description, required this.name, required this.time, required this.token, required this.bookingId,
  }) : super(key: key);
  final String token;
  final int bookingId;
  final String imageLink;
  final String status;
  final String description;
  final String name;
  final String time;

  @override
  State<BookingListViewWidget> createState() => _BookingListViewWidgetState();
}

class _BookingListViewWidgetState extends State<BookingListViewWidget> {
  late BookingAcceptModel bookingAcceptModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.w,right: 10.h,top: 10.h,bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow:  const [BoxShadow(
            color: ColorsManager.lightGrey,
            blurStyle: BlurStyle.outer,
            offset: Offset(2, 2),
            spreadRadius: 0,
            blurRadius: 8,
          )]
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.h,top: 20.h,bottom: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                      widget.imageLink, height: 60.h, width: 60.w),
                  horizontalSpacing(5),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.name, style: TextStyles.font18Black500),
                        Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: getStatusColor(),
                                borderRadius: BorderRadius.circular(90),
                              ),
                            ),
                            horizontalSpacing(3),
                            Text(
                             widget.status,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: getStatusColor(),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.time,
                          style: TextStyles.font14Gray.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpacing(10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Description :  ',
                      style: TextStyles.font12Black500,
                    ),
                    TextSpan(
                      text:
                      widget.description,
                      style: TextStyles.font14Gray.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              verticalSpacing(10),
              widget.status == S.of(context).complete ?
              const SizedBox():
              BlocListener<BookingAcceptCubit,BookingAcceptStates>(
                listener: (context, state) {
                  state.whenOrNull(
                      loading: (){
                        showDialog(context: context, builder:
                            (context) => const Center(child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),),
                        );
                      },
                      success: (bookingAcceptResponse){
                        bookingAcceptModel = bookingAcceptResponse;

                        setupAcceptState(context, bookingAcceptModel.message!.first.toString());
                      },
                      error:(error){
                        setupErrorState(context, error);
                      } );
                },
                child: AppTextButton(
                    buttonHeight: 50.h,
                    textStyle: TextStyles.font19White600,
                    textButton: getStatusButton(), onPressed: (){
                  widget.status == S.of(context).pending?
                  context.read<BookingAcceptCubit>().emitBookingAcceptData(bookingId: widget.bookingId, token: widget.token,):null;
                }),
              )
            ],
          ),
        ),
      ),
    );

  }

  String getStatusButton(){
    switch (widget.status){
      case "pending":
        return "Accept";
      case "active":
        return "View";
      default:
        return "";
    }
}

  Color getStatusColor() {
    switch (widget.status) {
      case "pending":
        return ColorsManager.pendingColor; // Set the color for pending status
      case "active":
        return ColorsManager.activeColor; // Set the color for active status
      case "complete":
        return ColorsManager.completeColor; // Set the color for complete status
      default:
        return Colors.black; // Default color
    }}
}
