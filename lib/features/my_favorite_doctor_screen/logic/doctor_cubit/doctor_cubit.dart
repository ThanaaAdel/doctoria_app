
import 'package:doctoria_app/features/my_favorite_doctor_screen/data/repos/doctor_repo.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/logic/doctor_cubit/doctor_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  final DoctorRepo doctorRepo;
  DoctorCubit(this.doctorRepo) : super(const DoctorStates.initial());


  void emitDoctorData(int categoryId) async {
    emit(const DoctorStates.loading());
    final response = await doctorRepo.doctorData(categoryId);
      print( response);
    response.when(success: (doctorData) {
      emit(DoctorStates.success(doctorData));
    }, failure: (error) {
      emit(DoctorStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
