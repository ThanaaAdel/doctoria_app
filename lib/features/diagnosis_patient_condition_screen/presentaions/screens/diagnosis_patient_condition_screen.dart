import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:doctoria_app/core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../widgets/add_report_widget.dart';
import '../widgets/content_prescription_widget.dart';
import '../widgets/diagnosis_widget.dart';
import '../widgets/diagonsis_list_widget.dart';
import '../widgets/photo_and_name_widget.dart';
import '../widgets/prescription_widget.dart';
import '../widgets/text_and_icons_widget.dart';

class DiagnosisPatientConditionScreen extends StatelessWidget {
  const DiagnosisPatientConditionScreen({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height, // Set a fixed height
        child: ListView(
          children: [
            AppBarWidget(
              widgetActions: Image.asset(ImageManager.refreshIcon),
              text: S.of(context).Diagnosis_patient_condition,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child:Column(
                children: [
                  const TextAndIconsWidget(),
                  PhotoAndNameWidget(name: name,image: image),
                  const AddReportWidget(),
                  const DiagnosisWidget(),
                  const DiagnosisListWidget(),
                  const PrescriptionWidget(),
                  const ContentPrescriptionWidget(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

