import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // //login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // //register
  // getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  // getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

 }