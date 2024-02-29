import '../../features/edit_profile_screen/presentaions/screens/edit_profile_screen.dart';
import '../../features/reports_details_screen/presentaions/screens/reports_details_screen.dart';
import '../../features/reports_screen/presentations/screens/reports_screen.dart';
import '../../features/buttom_navigation/presentaions/buttom_navigation.dart';
import '../../features/create_new_password_screen/presentations/screens/create_new_password_screen.dart';
import '../../features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import '../../features/sign_in_screen/presentaions/screens/sign_in_screen.dart';
import '../../features/sign_up_screen/logic/sign_up/sign_up_cubit.dart';
import '../../features/sign_up_screen/presentaions/screens/sign_up_screen.dart';
import '../../features/splash_screen/presentaions/screens/splash_screen.dart';
import '../../features/verification_screen/presentaions/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home_screen/presentations/screens/home_screen.dart';
import '../../features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';
import '../../features/reset_password/presentations/screens/reset_password_screen.dart';
import '../di/dependacy_injection.dart';
import 'routers.dart';
class AppRouter {
Route generateRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.splashScreen:
    return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    case Routes.onBoardingScreen:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);
    case Routes.signUpScreen:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const SignUpScreen()),);
    case Routes.signInScreen:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<SignInCubit>(),
          child: const SignInScreen()),);
    case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (context) => const ResetPasswordScreen(),);
    case Routes.createNewPassword:
      return MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen(),);
    case Routes.buttomNavigation:
      return MaterialPageRoute(builder: (context) => const ButtonNavigation(),);
    case Routes.verificationScreen:
      return MaterialPageRoute(builder: (context) => const VerificationScreen(phoneNumber: '01026267450',),);
    case Routes.reportsScreen:
      return MaterialPageRoute(builder: (context) => const ReportsScreen(),);
    case Routes.reportsDetailsScreen:
      return MaterialPageRoute(builder: (context) => const ReportsDetailsScreen(),);
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen(),);
    case Routes.editProfileScreen:
      return MaterialPageRoute(builder: (context) => const EditProfileScreen(),);
    // case Routes.registerScreen:
    //   return MaterialPageRoute(builder: (context) => BlocProvider(
    //       create: (context) => getIt<RegisterCubit>(),
    //       child: const RegisterScreen()),);
    // case Routes.loginScreen:
    //   return MaterialPageRoute(builder: (context) => BlocProvider(
    //       create: (context) => getIt<LoginCubit>(),
    //       child: const LoginScreen()),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("No route defind ${settings.name}")),),);
  }
}
}