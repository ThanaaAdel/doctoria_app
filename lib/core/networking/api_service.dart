import 'package:dio/dio.dart' hide Headers;
import 'package:doctoria_app/features/sign_in_screen/data/models/api_patient_response_sign_in.dart';
import '../../features/sign_in_screen/data/models/sign_in_request_body.dart';
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  @FormUrlEncoded()
  Future<PatientResponseBody> login(
      @Body() SignInRequestBody loginRequestBody,
      );
  // @POST(ApiConstant.register)
  // @FormUrlEncoded()
  // Future<ApiResponse> register(
  //     @Body() RegisterRequestBody registerRequestBody,
  //     );
  // @POST(ApiConstant.logout)
  // Future<ApiResponse> logout(
  //     );
}


