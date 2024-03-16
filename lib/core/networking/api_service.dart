import 'package:dio/dio.dart' hide Headers;
import 'package:doctoria_app/features/my_consultations_screen/data/models/booking_accept_model/booking_accept_model.dart';
import 'package:doctoria_app/features/my_consultations_screen/data/models/booking_model/booking_model.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/data/models/doctor_model/doctor_model.dart';
import '../../features/diagnosis_patient_condition_screen/data/models/booking_accept_details_request/booking_accept_details_request.dart';
import '../../features/diagnosis_patient_condition_screen/data/models/booking_acceptt_details_model/booking_accept_details_response_body_model.dart';
import '../../features/home_patient_screen/data/models/slider_model/slider_model.dart';
import '../../features/home_patient_screen/data/models/specialization_popular_doctors_model/specialization_popular_doctors_model.dart';
import '../../features/my_consultations_screen/data/models/booking_accept_model/request/booking_accept_request_model.dart';
import '../../features/profile_screen/data/models/logout_model/logout_model.dart';
import '../../features/sign_up_screen/data/models/request_body/sign_up_request_body.dart';
import '../../features/sign_up_screen/data/models/response_body/sign_up_response_data_model.dart';
import '../../features/sign_in_screen/data/models/request/sign_in_request_body.dart';
import '../../features/sign_in_screen/data/models/response/sign_in_response_body.dart';
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // signIn
  @POST(ApiConstant.login)
  @FormUrlEncoded()
  Future<SignInResponseBody> login(
      @Body() SignInRequestBody loginRequestBody,
      );

  //signUp
  @POST(ApiConstant.signUp)
  @FormUrlEncoded()
  Future<SignUpResponseBody> signUp(
      @Body() SignUpRequestBody signUpRequestBody,
      );
  // logout
  @POST(ApiConstant.logout)
  @FormUrlEncoded()
  Future<LogoutDataModel> logout(
      @Header("Authorization") String token,
      );
  // homeSlider data
  @GET(ApiConstant.homeSlider)
  @FormUrlEncoded()
  Future<SliderModel> homeSliderData();

  // specializationPopularDoctorsData
  @GET(ApiConstant.specializationPopularDoctors)
  @FormUrlEncoded()
  Future<SpecializationPopularDoctorsModel> specializationPopularDoctorsData();

  //MyFavoriteDoctorScreen

  @GET(ApiConstant.doctor)
  @FormUrlEncoded()
  Future<DoctorModel> doctorData(@Query("category_id") int categoryId);

// booking
  @GET(ApiConstant.bookingPatient)
  @FormUrlEncoded()
  Future<BookingModel> bookingData(
      @Query("status") String status,
      @Header("Authorization") String token,
      );
  // booking accept
  @POST(ApiConstant.bookingAccept)
  @FormUrlEncoded()
  Future<BookingAcceptModel> bookingAccept(
      @Body() BookingAcceptRequestBody bookingAcceptRequestBody,
     @Header("Authorization") String token,
      );
  // booking accept details
  @POST(ApiConstant.bookingAcceptDetails)
  @FormUrlEncoded()
  Future<BookingAcceptDetailsResponseBody> bookingAcceptDetails(
      @Body() BookingAcceptDetailsRequestBody bookingAcceptDetailsRequestBody,
      @Header("Authorization") String token,
      );

}


