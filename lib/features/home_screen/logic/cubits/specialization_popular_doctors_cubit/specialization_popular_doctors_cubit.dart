import 'specialization_popular_doctors_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/specialization_popular_doctors_repo/specialization_popular_doctors_repo.dart';
class SpecializationPopularDoctorsCubit extends Cubit<SpecializationPopularDoctorsCubitStates> {
  final SpecializationPopularDoctorsRepo specializationPopularDoctorsRepo;
  SpecializationPopularDoctorsCubit(this.specializationPopularDoctorsRepo) : super(const SpecializationPopularDoctorsCubitStates.initial());
  void emitSpecializationPopularDoctors() async {
    emit(const SpecializationPopularDoctorsCubitStates.loading());
    final response = await specializationPopularDoctorsRepo.specializationPopularDoctors();
    response.when(success: (specializationPopularDoctorsData) {
      emit(SpecializationPopularDoctorsCubitStates.success(specializationPopularDoctorsData));
    }, failure: (error) {
      emit(SpecializationPopularDoctorsCubitStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
