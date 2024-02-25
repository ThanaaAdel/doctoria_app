import '../../data/models/request/sign_in_request_body.dart';
import '../../data/repos/sign_in_repo.dart';
import 'sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo signInRepo;
  SignInCubit(this.signInRepo) : super(const SignInState.initial());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignInStates() async {
    emit(const SignInState.loading());
    final response = await signInRepo.login(SignInRequestBody(
        phone: phoneController.text, password: passwordController.text));
    response.when(success: (signInResponse) {
      emit(SignInState.success(signInResponse));
    }, failure: (error) {
      emit(SignInState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
