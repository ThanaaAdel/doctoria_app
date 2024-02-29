import 'package:doctoria_app/core/shared_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:AppBarWidget(text: S.of(context).doctor_details,widgetActions:Row(
      children: [

      ],
    )

    ),);
  }
}
