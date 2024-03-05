import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_accept_states.freezed.dart';
@freezed
abstract class BookingAcceptStates<T> with _$BookingAcceptStates<T> {
  const factory BookingAcceptStates.initial() = _Initial;
  const factory BookingAcceptStates.loading() = Loading;
  const factory BookingAcceptStates.success(T data) = Success<T>;
  const factory BookingAcceptStates.error({required String error}) = Error;

}
