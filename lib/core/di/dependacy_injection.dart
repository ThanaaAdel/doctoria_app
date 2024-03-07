import 'package:dio/dio.dart';
import 'package:doctoria_app/features/my_consultations_screen/data/repos/booking_accept_repo/booking_accept_repo.dart';
import 'package:doctoria_app/features/my_consultations_screen/data/repos/booking_repo/booking_repo.dart';
import 'package:doctoria_app/features/my_consultations_screen/logic/booking_cubit/booking_cubit.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/data/repos/doctor_repo.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/logic/doctor_cubit/doctor_cubit.dart';
import 'package:doctoria_app/features/profile_screen/data/repos/logout_repo.dart';
import 'package:doctoria_app/features/profile_screen/logic/logout_cubit/logout_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/diagnosis_patient_condition_screen/data/repos/booking_acceptt_details_repo/booking_acceptt_details_repo.dart';
import '../../features/diagnosis_patient_condition_screen/logic/booking_accept_details_cubit/booking_accept_details_cubit.dart';
import '../../features/home_patient_screen/data/repos/home_slider_repo/home_slider_repo.dart';
import '../../features/home_patient_screen/data/repos/specialization_popular_doctors_repo/specialization_popular_doctors_repo.dart';
import '../../features/home_patient_screen/logic/cubits/slider_cubit/slider_cubit.dart';
import '../../features/home_patient_screen/logic/cubits/specialization_popular_doctors_cubit/specialization_popular_doctors_cubit.dart';
import '../../features/my_consultations_screen/logic/booking_accept_cubit/booking_accept_cubit.dart';
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
  //doctorData
  getIt.registerLazySingleton<DoctorRepo>(() => DoctorRepo(getIt()));
  getIt.registerFactory<DoctorCubit>(() => DoctorCubit(getIt()));
  // booking
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepo(getIt()));
  getIt.registerFactory<BookingCubit>(() => BookingCubit(getIt()));
 // logout
  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));
  // booking accept
  getIt.registerLazySingleton<BookingAcceptRepo>(() => BookingAcceptRepo(getIt()));
  getIt.registerFactory<BookingAcceptCubit>(() => BookingAcceptCubit(getIt()));
  // booking accept Details
  getIt.registerLazySingleton<BookingAcceptDetailsRepo>(() => BookingAcceptDetailsRepo(getIt()));
  getIt.registerFactory<BookingAcceptDetailsCubit>(() => BookingAcceptDetailsCubit(getIt()));
 }