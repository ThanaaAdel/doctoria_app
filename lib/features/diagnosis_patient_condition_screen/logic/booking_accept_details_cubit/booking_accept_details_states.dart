import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_accept_details_states.freezed.dart';
@freezed
abstract class BookingAcceptDetailsStates<T> with _$BookingAcceptDetailsStates<T> {
  const factory BookingAcceptDetailsStates.initial() = _Initial;
  const factory BookingAcceptDetailsStates.loading() = Loading;
  const factory BookingAcceptDetailsStates.success(T data) = Success<T>;
  const factory BookingAcceptDetailsStates.error({required String error}) = Error;

}
