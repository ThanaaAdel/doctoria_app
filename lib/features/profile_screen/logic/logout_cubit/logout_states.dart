import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_states.freezed.dart';
@freezed
abstract class LogoutStates<T> with _$LogoutStates<T> {
  const factory LogoutStates.initial() = _Initial;
  const factory LogoutStates.loading() = Loading;
  const factory LogoutStates.success(T data) = Success<T>;
  const factory LogoutStates.error({required String error}) = Error;

}
