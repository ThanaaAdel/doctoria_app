
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/request/sign_in_request_body.dart';
import '../models/response/sign_in_response_body.dart';

class SignInRepo {
  final ApiService _apiService;

  SignInRepo(this._apiService);
  Future<ApiResult<SignInResponseBody>> login(SignInRequestBody signInRequestBody) async{
    try{
      final response = await _apiService.login(signInRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
