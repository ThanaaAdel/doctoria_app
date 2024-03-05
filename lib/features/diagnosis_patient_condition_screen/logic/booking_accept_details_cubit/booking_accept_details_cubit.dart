import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/booking_accept_details_request/booking_accept_details_request.dart';
import '../../data/repos/booking_acceptt_details_repo/booking_acceptt_details_repo.dart';
import 'booking_accept_details_states.dart';

class BookingAcceptDetailsCubit extends Cubit<BookingAcceptDetailsStates> {
  final BookingAcceptDetailsRepo bookingAcceptDetailsRepo;
  BookingAcceptDetailsCubit(this.bookingAcceptDetailsRepo) : super(const BookingAcceptDetailsStates.initial());

  void emitBookingAcceptDetailsData(
      {required int bookingId, required String token}) async {
    emit(const BookingAcceptDetailsStates.loading());
    final response = await bookingAcceptDetailsRepo.bookingAcceptDetails(BookingAcceptDetailsRequestBody(bookingId: bookingId,),
        token: token);
    response.when(success: (bookingAcceptDetailsData) {
      emit(BookingAcceptDetailsStates.success(bookingAcceptDetailsData));
    }, failure: (error) {
      emit(BookingAcceptDetailsStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
