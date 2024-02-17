import 'package:flutter/material.dart';
import 'package:home_indicator/home_indicator.dart';

import 'core/Routing/app_router.dart';
import 'core/di/dependacy_injection.dart';
import 'doctoria_app.dart';

void main() {

  setupGetIt();
  runApp( DoctorIaApp(appRouter: AppRouter(),));
}


