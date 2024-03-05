
import '../../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../../core/networking/api_service.dart';
import '../../models/booking_accept_model/booking_accept_model.dart';
import '../../models/booking_accept_model/request/booking_accept_request_model.dart';

class BookingAcceptRepo {
  final ApiService _apiService;
  BookingAcceptRepo(this._apiService);
  Future<ApiResult<BookingAcceptModel>> bookingAcceptData(BookingAcceptRequestBody bookingAcceptRequestBody,{required String token}) async{
    try{
      final response = await _apiService.bookingAccept(

          bookingAcceptRequestBody,token);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}


