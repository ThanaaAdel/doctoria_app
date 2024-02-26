import 'package:dio/dio.dart';
import 'package:doctoria_app/features/home_screen/data/repos/specialization_popular_doctors_repo/specialization_popular_doctors_repo.dart';
import 'package:doctoria_app/features/home_screen/logic/cubits/specialization_popular_doctors_cubit/specialization_popular_doctors_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home_screen/data/repos/home_slider_repo/home_slider_repo.dart';
import '../../features/home_screen/logic/cubits/slider_cubit/slider_cubit.dart';
import '../../features/sign_in_screen/data/repos/sign_in_repo.dart';
import '../../features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import '../../features/sign_up_screen/data/repos/sign_up_repo.dart';
import '../../features/sign_up_screen/logic/sign_up/sign_up_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));
  //slider
  getIt.registerLazySingleton<SliderRepo>(() => SliderRepo(getIt()));
  getIt.registerFactory<SliderCubit>(() => SliderCubit(getIt()));
  //signUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  //specializationPopularDoctors
  getIt.registerLazySingleton<SpecializationPopularDoctorsRepo>(() => SpecializationPopularDoctorsRepo(getIt()));
  getIt.registerFactory<SpecializationPopularDoctorsCubit>(() => SpecializationPopularDoctorsCubit(getIt()));
 }