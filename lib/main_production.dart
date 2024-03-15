import 'package:flutter/material.dart';
import 'core/Routing/app_router.dart';
import 'core/di/dependacy_injection.dart';
import 'doctoria_app.dart';

void main() async{
  setupGetIt();
  runApp( DoctorIaApp(

      appRouter: AppRouter(),
  ));
}

