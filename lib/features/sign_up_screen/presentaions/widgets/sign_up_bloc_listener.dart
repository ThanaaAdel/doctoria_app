import '../../data/models/response_body/sign_up_response_data_model.dart';
import '../../logic/sign_up/sign_up_cubit.dart';
import '../../logic/sign_up/sign_up_cubit_states.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/styles.dart';
class SignUpBlocListener extends StatefulWidget {
  const SignUpBlocListener({super.key});

  @override
  State<SignUpBlocListener> createState() => _SignInBlocListenerState();
}

class _SignInBlocListenerState extends State<SignUpBlocListener> {
  late SignUpResponseBody signUpResponseBody;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpStates>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
            loading: (){
              showDialog(context: context, builder:
                  (context) => const Center(child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),),
              );
            },
            success: (loginResponse){
              signUpResponseBody = loginResponse;
              context.pop();
              context.pushNamed(Routes.homeScreen);
            },
            error:(error){
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
