import 'package:freezed_annotation/freezed_annotation.dart';
part 'slider_cubit_states.freezed.dart';
@freezed
abstract class SliderCubitStates<T> with _$SliderCubitStates<T> {
  const factory SliderCubitStates.initial() = _Initial;
  const factory SliderCubitStates.loading() = Loading;
  const factory SliderCubitStates.success(T data) = Success<T>;
  const factory SliderCubitStates.error({required String error}) = Error;
}