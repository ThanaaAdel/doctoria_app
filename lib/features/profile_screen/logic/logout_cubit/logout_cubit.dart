
import 'package:doctoria_app/features/profile_screen/data/repos/logout_repo.dart';
import 'package:doctoria_app/features/profile_screen/logic/logout_cubit/logout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  final LogoutRepo doctorRepo;
  LogoutCubit(this.doctorRepo) : super(const LogoutStates.initial());


  void emitLogout(String token) async {
    emit(const LogoutStates.loading());
    final response = await doctorRepo.logout(token);
    response.when(success: (logoutData) {
      emit(LogoutStates.success(logoutData));
    }, failure: (error) {
      emit(LogoutStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
