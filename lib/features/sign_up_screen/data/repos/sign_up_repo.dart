import '../models/request_body/sign_up_request_body.dart';
import '../models/response_body/sign_up_response_data_model.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);
  Future<ApiResult<SignUpResponseBody>> signUp(SignUpRequestBody signUpRequestBody) async{
    try{
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
