import 'package:doctoria_app/features/sign_in_screen/data/models/api_patient_response_sign_in.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/sign_in_request_body.dart';

class SignInRepo {
  final ApiService _apiService;

  SignInRepo(this._apiService);
  Future<ApiResult<PatientResponseBody>> login(SignInRequestBody signInRequestBody) async{
    try{
      final response = await _apiService.login(signInRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
// Future<Object?> logout() async{
//   try{
//     final response = await _apiService.logout();
//     return response;
//   }catch(error){
//     return  ApiResponse().message ;
//   }
// }

}
