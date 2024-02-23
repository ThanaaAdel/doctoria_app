import 'package:dio/dio.dart';
import 'package:doctoria_app/features/sign_in_screen/data/repos/sign_in_repo.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';
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
  // //register
  // getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  // getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

 }