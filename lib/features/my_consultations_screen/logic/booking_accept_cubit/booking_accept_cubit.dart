import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/booking_accept_model/request/booking_accept_request_model.dart';
import '../../data/repos/booking_accept_repo/booking_accept_repo.dart';
import 'booking_accept_states.dart';

class BookingAcceptCubit extends Cubit<BookingAcceptStates> {
  final BookingAcceptRepo bookingAcceptRepo;
  BookingAcceptCubit(this.bookingAcceptRepo)
      : super(const BookingAcceptStates.initial());

  void emitBookingAcceptData(
      {required int bookingId, required String token}) async {
    emit(const BookingAcceptStates.loading());
    final response = await bookingAcceptRepo.bookingAcceptData(
        BookingAcceptRequestBody(
          bookingId: bookingId,
        ),
        token: token);
    response.when(success: (bookingAcceptData) {
      emit(BookingAcceptStates.success(bookingAcceptData));
    }, failure: (error) {
      emit(BookingAcceptStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
