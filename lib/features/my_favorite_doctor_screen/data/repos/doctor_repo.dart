import 'package:doctoria_app/features/my_favorite_doctor_screen/data/models/doctor_model/doctor_model.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class DoctorRepo {
  final ApiService _apiService;
  DoctorRepo(this._apiService);
  Future<ApiResult<DoctorModel>> doctorData(int categoryId) async{
    try{
      final response = await _apiService.doctorData(categoryId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}


