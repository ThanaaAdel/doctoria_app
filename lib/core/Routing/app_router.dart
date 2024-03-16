import 'package:doctoria_app/features/add_diagnosis_screen/presentations/screens/add_diagnosis_screen.dart';
import 'package:doctoria_app/features/add_report_screen/presentaions/screens/add_report_screen.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_cubit.dart';
import 'package:doctoria_app/features/doctor_details_screen/presentaions/screens/doctor_details_screen.dart';
import 'package:doctoria_app/features/my_consultations_screen/presentations/screens/my_consultations_screen.dart';
import 'package:doctoria_app/features/profile_screen/presentations/screens/profile_screen.dart';
import '../../features/buttom_navigation_doctor/presentaions/buttom_navigation_doctor.dart';
import '../../features/buttom_navigation_patient/presentaions/buttom_navigation_patient.dart';
import '../../features/create_new_password_screen/presentations/screens/create_new_password_screen.dart';
import '../../features/diagnosis_patient_condition_screen/presentaions/screens/diagnosis_patient_condition_screen.dart';
import '../../features/edit_profile_screen/presentaions/screens/edit_profile_screen.dart';
import '../../features/home_patient_screen/presentations/screens/home_patient_screen.dart';
import '../../features/my_consultations_screen/logic/booking_accept_cubit/booking_accept_cubit.dart';
import '../../features/my_consultations_screen/logic/booking_cubit/booking_cubit.dart';
import '../../features/my_favorite_doctor_screen/logic/doctor_cubit/doctor_cubit.dart';
import '../../features/my_favorite_doctor_screen/presentaions/screens/my_favorite_doctor_screen.dart';
import '../../features/reports_details_screen/presentaions/screens/reports_details_screen.dart';
import '../../features/reports_screen/presentations/screens/reports_screen.dart';
import '../../features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import '../../features/sign_in_screen/presentaions/screens/sign_in_screen.dart';
import '../../features/sign_up_screen/logic/sign_up/sign_up_cubit.dart';
import '../../features/sign_up_screen/presentaions/screens/sign_up_screen.dart';
import '../../features/splash_screen/presentaions/screens/splash_screen.dart';
import '../../features/verification_screen/presentaions/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';
import '../../features/reset_password/presentations/screens/reset_password_screen.dart';
import '../di/dependacy_injection.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.addReportScreen:
        return MaterialPageRoute(
          builder: (context) => const AddReportScreen(),
        );
      case Routes.addDiagnosisScreen:
        return MaterialPageRoute(
          builder: (context) => const AddDiagnosisScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: const SignUpScreen()),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<SignInCubit>(),
            ),
          ], child: const SignInScreen()),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );
      case Routes.diagnosisPatientConditionScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final int bookingId = args['bookingId'] as int;
        final String token = args['token'] as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<BookingAcceptDetailsCubit>(),
            child: DiagnosisPatientConditionScreen(bookingId: bookingId, token: token),
          ),
        );

      case Routes.createNewPassword:
        return MaterialPageRoute(
          builder: (context) => const CreateNewPasswordScreen(),
        );
      case Routes.buttomNavigationPatient:
        return MaterialPageRoute(
          builder: (context) => ButtonNavigationPatient(),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (context) => const VerificationScreen(
            phoneNumber: '01026267450',
          ),
        );
      case Routes.reportsScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportsScreen(),
        );
      case Routes.reportsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportsDetailsScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomePatientScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case Routes.doctorDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DoctorDetailsScreen(),
        );
      case Routes.buttomNavigationDoctor:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BookingCubit>(),
              ),
            ],
            child: ButtonNavigationDoctor(),
          ),
        );

      case Routes.myConsultationScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BookingAcceptCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<BookingAcceptDetailsCubit>(),
              ),
            ],
            child: const MyConsultationsScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.myFavoriteDoctorScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<DoctorCubit>()),
              // Add more BlocProviders if needed
            ],
            child: const MyFavoriteDoctorScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defind ${settings.name}")),
          ),
        );
    }
  }
}
