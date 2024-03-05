import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_states.freezed.dart';
@freezed
abstract class BookingStates<T> with _$BookingStates<T> {
  const factory BookingStates.initial() = _Initial;
  const factory BookingStates.loading() = Loading;
  const factory BookingStates.success(T data) = Success<T>;
  const factory BookingStates.error({required String error}) = Error;

}
