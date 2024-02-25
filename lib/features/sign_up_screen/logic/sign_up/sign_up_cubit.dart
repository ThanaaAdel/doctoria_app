import '../../data/models/request_body/sign_up_request_body.dart';
import '../../data/repos/sign_up_repo.dart';
import 'sign_up_cubit_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(const SignUpStates.initial());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController referCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignUpStates.loading());
    final response = await signUpRepo.signUp(
        SignUpRequestBody(
        confirmPassword: confirmPasswordController.text,
        password: passwordController.text,
        phone: phoneController.text,
        referralCode: referCodeController.text)
    );
    response.when(success: (signUpResponse) {
      emit(SignUpStates.success(signUpResponse));
    }, failure: (error) {
      emit(SignUpStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
