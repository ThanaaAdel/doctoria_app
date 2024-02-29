import '../../../../core/shared_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ReportsDetailsScreen extends StatelessWidget {
  const ReportsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
            text: S.of(context).reports_details,
          ),
        ],
      ),
    );
  }
}
