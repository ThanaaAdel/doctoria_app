import 'package:doctoria_app/features/diagnosis_patient_condition_screen/data/models/booking_accept_details_request/booking_accept_details_request.dart';
import 'package:doctoria_app/features/diagnosis_patient_condition_screen/data/models/booking_acceptt_details_model/booking_accept_details_response_body_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class BookingAcceptDetailsRepo {
  final ApiService _apiService;

  BookingAcceptDetailsRepo(this._apiService);
  Future<ApiResult<BookingAcceptDetailsResponseBody>> bookingAcceptDetails(
      BookingAcceptDetailsRequestBody bookingAcceptDetailsRequestBody,{required String token}) async{
    try{
      final response = await _apiService.bookingAcceptDetails(bookingAcceptDetailsRequestBody, token);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
