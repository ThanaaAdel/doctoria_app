import 'package:freezed_annotation/freezed_annotation.dart';
part 'specialization_popular_doctors_cubit_states.freezed.dart';
@freezed
abstract class SpecializationPopularDoctorsCubitStates<T> with _$SpecializationPopularDoctorsCubitStates<T> {
  const factory SpecializationPopularDoctorsCubitStates.initial() = _Initial;
  const factory SpecializationPopularDoctorsCubitStates.loading() = Loading;
  const factory SpecializationPopularDoctorsCubitStates.success(T data) = Success<T>;
  const factory SpecializationPopularDoctorsCubitStates.error({required String error}) = Error;
}