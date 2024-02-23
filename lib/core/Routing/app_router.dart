import 'package:doctoria_app/features/create_new_password_screen/presentions/screens/create_new_password_screen.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import 'package:doctoria_app/features/sign_in_screen/presentaions/screens/sign_in_screen.dart';
import 'package:doctoria_app/features/sign_up_screen/presentaions/screens/sign_up_screen.dart';
import 'package:doctoria_app/features/splash_screen/presentaions/screens/spash_screen.dart';
import 'package:doctoria_app/features/verification_screen/presentaions/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home_screen/presentations/screens/home_screen.dart';
import '../../features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';
import '../../features/reset_password/presentions/screens/reset_password_screen.dart';
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
      return MaterialPageRoute(builder: (context) => const SignUpScreen(),);
    case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (context) => const ResetPasswordScreen(),);
    case Routes.createNewPassword:
      return MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen(),);
    case Routes.verificationScreen:
      return MaterialPageRoute(builder: (context) => const VerificationScreen(phoneNumber: '01026267450',),);
    case Routes.signInScreen:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<SignInCubit>(),
          child: const SignInScreen()),);
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen(),);
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