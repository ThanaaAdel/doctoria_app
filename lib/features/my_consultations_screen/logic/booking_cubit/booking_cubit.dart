

import 'package:doctoria_app/features/my_consultations_screen/logic/booking_cubit/booking_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/booking_repo/booking_repo.dart';

class BookingCubit extends Cubit<BookingStates> {
  final BookingRepo bookingRepo;
  BookingCubit(this.bookingRepo) : super(const BookingStates.initial());


  void emitBookingData({required String status,required String token}) async {
    emit(const BookingStates.loading());
    final response = await bookingRepo.bookingData(status: status,token: token);
    response.when(success: (bookingData) {
      emit(BookingStates.success(bookingData));
    }, failure: (error) {
      emit(BookingStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
