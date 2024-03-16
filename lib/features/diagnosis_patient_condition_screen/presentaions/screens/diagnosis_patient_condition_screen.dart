import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:doctoria_app/core/theming/image_manager.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/data/models/booking_acceptt_details_model/booking_accept_details_response_body_model.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_cubit.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/dependacy_injection.dart';
import '../../../../core/networking/api_constant.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../my_consultations_screen/presentations/widgets/setup_error_fun.dart';
import '../widgets/add_report_widget.dart';
import '../widgets/content_prescription_widget.dart';
import '../widgets/diagnosis_widget.dart';
import '../widgets/diagonsis_list_widget.dart';
import '../widgets/photo_and_name_widget.dart';
import '../widgets/prescription_widget.dart';
import '../widgets/text_and_icons_widget.dart';

class DiagnosisPatientConditionScreen extends StatefulWidget {
  const DiagnosisPatientConditionScreen({Key? key, required this.bookingId, required this.token}) : super(key: key);

  final int bookingId;
  final String token;

  @override
  State<DiagnosisPatientConditionScreen> createState() => _DiagnosisPatientConditionScreenState();
}

class _DiagnosisPatientConditionScreenState extends State<DiagnosisPatientConditionScreen> {
  @override
  void initState() {
    super.initState();
    // Initiate the API call to fetch data when the screen is first loaded
    context.read<BookingAcceptDetailsCubit>().emitBookingAcceptDetailsData(
      bookingId: widget.bookingId,
      token: widget.token,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<BookingAcceptDetailsCubit, BookingAcceptDetailsStates>(
          builder: (context, state) {
            return ListView(
              children: [
                // Your app bar or other widgets here
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: state.when(
                    initial: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      );
                    },
                    success: (data) {
                      final BookingAcceptDetailsResponseBody bookingAcceptDetailsResponseBody = data;
                      return Column(
                        children: [
                          const TextAndIconsWidget(),
                          PhotoAndNameWidget(
                            name: bookingAcceptDetailsResponseBody.data!.patient!.name.toString(),
                            image: bookingAcceptDetailsResponseBody.data!.patient!.image.toString(),
                          ),
                          const AddReportWidget(),
                          const DiagnosisWidget(),
                          const DiagnosisListWidget(),
                          const PrescriptionWidget(),
                          const ContentPrescriptionWidget(),
                        ],
                      );
                    },
                    error: (error) {
                      // Show error state
                      setupErrorState(context, error);
                      return Container(); // Return an empty container if needed
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

