import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/slider_model/slider_model.dart';
class SliderRepo {
  final ApiService _apiService;
  SliderRepo(this._apiService);
  Future<ApiResult<SliderModel>> homeSlider() async{
    try{
      final response = await _apiService.homeSliderData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
