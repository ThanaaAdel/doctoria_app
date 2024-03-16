import 'package:doctoria_app/features/profile_screen/data/models/logout_model/logout_model.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class LogoutRepo {
  final ApiService _apiService;
  LogoutRepo(this._apiService);
  Future<ApiResult<LogoutDataModel>> logout(String token) async{
    try{
      final response = await _apiService.logout(token);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}


