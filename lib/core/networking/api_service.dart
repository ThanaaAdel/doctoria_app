// import 'package:dio/dio.dart' hide Headers;
// import 'api_constant.dart';
// import 'package:retrofit/retrofit.dart';
// part 'api_service.g.dart';
// @RestApi(baseUrl: ApiConstant.apiBaseUrl)
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
//
//   @POST(ApiConstant.login)
//   @FormUrlEncoded()
//   Future<ApiResponse> login(
//       @Body() LoginRequestBody loginRequestBody,
//       );
//   @POST(ApiConstant.register)
//   @FormUrlEncoded()
//   Future<ApiResponse> register(
//       @Body() RegisterRequestBody registerRequestBody,
//       );
//   @POST(ApiConstant.logout)
//   Future<ApiResponse> logout(
//       );
// }
//
//
