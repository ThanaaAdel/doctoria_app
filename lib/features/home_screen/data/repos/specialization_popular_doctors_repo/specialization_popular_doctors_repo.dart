import '../../models/specialization_popular_doctors_model/specialization_popular_doctors_model.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
class SpecializationPopularDoctorsRepo {
  final ApiService _apiService;
  SpecializationPopularDoctorsRepo(this._apiService);
  Future<ApiResult<SpecializationPopularDoctorsModel>> specializationPopularDoctors() async{
    try{
      final response = await _apiService.specializationPopularDoctorsData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
