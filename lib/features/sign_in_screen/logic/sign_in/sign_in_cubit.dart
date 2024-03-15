import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_constant.dart';
import '../../data/models/request/sign_in_request_body.dart';
import '../../data/repos/sign_in_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo signInRepo;

  SignInCubit(this.signInRepo) : super(const SignInState.initial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignInStates() async {
    emit(const SignInState.loading());
    final response = await signInRepo.login(SignInRequestBody(
      phone: phoneController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (signInResponse) {
        _saveToken(signInResponse.data!.token!);
        _savePatientOrDoctor(signInResponse.data!.type!);
        emit(SignInState.success(signInResponse));
      },
      failure: (error) {
        emit(SignInState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiConstant.keyAccessToken, token);
  }

  Future<void> _savePatientOrDoctor(String patientOrDoctor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiConstant.patientOrDoctor, patientOrDoctor);
  }

  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(ApiConstant.keyAccessToken);
    emit(const SignInState.error(error: 'Unauthorized'));
  }
}
