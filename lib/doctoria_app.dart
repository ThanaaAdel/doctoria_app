import 'package:shared_preferences/shared_preferences.dart';
import 'core/networking/api_constant.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klocalizations_flutter/klocalizations_flutter.dart';
import 'core/Routing/app_router.dart';
import 'core/Routing/routers.dart';
import 'core/theming/colors.dart';

class DoctorIaApp extends StatefulWidget {
  final AppRouter appRouter;

  const DoctorIaApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  State<DoctorIaApp> createState() => _DoctorIaAppState();
}

class _DoctorIaAppState extends State<DoctorIaApp> {
  late String token;
  late String checkPatientOrDoctor;

  @override
  void initState() {
    super.initState();
    loadToken();
    patientOrDoctor();
  }

  Future<void> loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? loadedToken = sharedPreferences.getString(ApiConstant.keyAccessToken);
    setState(() {
      token = loadedToken ?? ''; // Initialize token with an empty string if loadedToken is null
    });
  }

  Future<void> patientOrDoctor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? loadedPatientOrDoctor = sharedPreferences.getString(ApiConstant.patientOrDoctor);
    setState(() {
      checkPatientOrDoctor = loadedPatientOrDoctor ?? ''; // Initialize checkPatientOrDoctor with an empty string if loadedPatientOrDoctor is null
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: token.isEmpty ? Routes.splashScreen : checkPatientOrDoctor == 'patient' ? Routes.buttomNavigationPatient : Routes.buttomNavigationDoctor,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  }
}
