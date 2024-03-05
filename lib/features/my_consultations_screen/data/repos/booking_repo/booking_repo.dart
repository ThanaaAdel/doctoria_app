import 'package:doctoria_app/features/my_consultations_screen/data/models/booking_model/booking_model.dart';

import '../../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../../core/networking/api_service.dart';

class BookingRepo {
  final ApiService _apiService;
  BookingRepo(this._apiService);
  Future<ApiResult<BookingModel>> bookingData({required String status,required String token}) async{
    try{
      final response = await _apiService.bookingData(status,token);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}


