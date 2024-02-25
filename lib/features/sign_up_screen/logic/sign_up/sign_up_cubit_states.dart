import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_cubit_states.freezed.dart';
@freezed
abstract class SignUpStates<T> with _$SignUpStates<T> {
  const factory SignUpStates.initial() = _Initial;
  const factory SignUpStates.loading() = Loading;
  const factory SignUpStates.success(T data) = Success<T>;
  const factory SignUpStates.error({required String error}) = Error;

}
