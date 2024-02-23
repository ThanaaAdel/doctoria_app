import 'package:doctoria_app/features/sign_in_screen/data/models/api_patient_response_sign_in.dart';
import 'package:doctoria_app/features/sign_in_screen/data/models/sign_in_request_body.dart';
import 'package:doctoria_app/features/sign_in_screen/data/repos/sign_in_repo.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInCubit extends Cubit<SignInState>{
  final SignInRepo signInRepo;
  SignInCubit(this.signInRepo):super(const SignInState.initial());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  final formKey = GlobalKey<FormState>();
  late PatientResponseBody patientData;
  void emitSignInStates() async {
    emit(const SignInState.loading());
    final response = await signInRepo.login(
      SignInRequestBody(phone: phoneController.text,
          password: passwordController.text)
    );
    response.when(success: (signInResponse){
      emit(SignInState.success(signInResponse));
      patientData =signInResponse;
    },

  failure: (error){
  emit(SignInState.error(error: error.apiErrorModel.message ?? ''));
  });
  }

}