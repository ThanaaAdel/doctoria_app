import 'package:doctoria_app/features/sign_in_screen/data/models/api_patient_response_sign_in.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_cubit.dart';
import 'package:doctoria_app/features/sign_in_screen/logic/sign_in/sign_in_state.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/styles.dart';
class SignInBlocListener extends StatefulWidget {
  const SignInBlocListener({super.key});

  @override
  State<SignInBlocListener> createState() => _SignInBlocListenerState();
}

class _SignInBlocListenerState extends State<SignInBlocListener> {
  late PatientResponseBody parentData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit,SignInState>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
      state.whenOrNull(loading: (){
        showDialog(context: context, builder:
        (context) => const Center(child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),),
        );
      }, success: (loginResponse){
        parentData = loginResponse;
        context.pop();
        context.pushNamed(Routes.homeScreen,arguments: parentData);
      }, error:(error){

        setupErrorState(context, error);
      } );
    },);
  }

  void setupErrorState(BuildContext context, String error) {
      context.pop();
    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: Text(error,
          style: TextStyles.font14Blue500,
          ),
          actions: [
            TextButton(onPressed: (){
              context.pop();
            }, child: Text('Got It ',style: TextStyles.font20Blue600,)),
          ],
          icon: const Icon(Icons.error,
          color: Colors.red,
            size: 32,
          ),
        ),);
  }
}
