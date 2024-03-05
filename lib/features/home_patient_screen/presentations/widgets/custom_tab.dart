import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
class CustomTab extends StatelessWidget {
  final String text;

  const CustomTab(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(

        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.mainBlue),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
