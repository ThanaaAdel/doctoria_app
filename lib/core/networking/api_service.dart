import 'package:dio/dio.dart' hide Headers;
import '../../features/sign_up_screen/data/models/request_body/sign_up_request_body.dart';
import '../../features/sign_up_screen/data/models/response_body/sign_up_response_data_model.dart';
import '../../features/home_screen/data/models/slider_model/slider_model.dart';
import '../../features/sign_in_screen/data/models/request/sign_in_request_body.dart';
import '../../features/sign_in_screen/data/models/response/sign_in_response_body.dart';
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  @FormUrlEncoded()
  Future<SignInResponseBody> login(
      @Body() SignInRequestBody loginRequestBody,
      );
  @POST(ApiConstant.signUp)
  @FormUrlEncoded()
  Future<SignUpResponseBody> signUp(
      @Body() SignUpRequestBody signUpRequestBody,
      );
  @GET(ApiConstant.homeSlider)
  @FormUrlEncoded()
  Future<SliderModel> homeSliderData();
  // @POST(ApiConstant.register)
  // @FormUrlEncoded()
  // Future<ApiResponse> register(
  //     @Body() RegisterRequestBody registerRequestBody,
  //     );
  // @POST(ApiConstant.logout)
  // Future<ApiResponse> logout(
  //     );
}


