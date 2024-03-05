import 'package:doctoria_app/features/profile_screen/data/models/logout_model/logout_model.dart';
import 'package:doctoria_app/features/profile_screen/logic/logout_cubit/logout_cubit.dart';
import 'package:doctoria_app/features/profile_screen/logic/logout_cubit/logout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependacy_injection.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/image_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/Routing/routers.dart';
import '../../../../core/shared_widgets/appbar_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../my_consultations_screen/presentations/widgets/setup_error_fun.dart';
import '../widgets/name_and_photo_patient.dart';
import '../widgets/profile_list_info.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBarWidget(text:S.of(context).profile,),
        Column(
          children: [
            const NameAndPhotoPatientWidget(),
            ProfileListInformation(
              iconUrl: ImageManager.editProfileIcon,
              textDesc: S.of(context).edit_profile,
              onPressed: () => context.pushNamed(Routes.editProfileScreen),
            ),
            ProfileListInformation(
              iconUrl: ImageManager.medicalFileProfileIcon,
              textDesc: S.of(context).medical_file_profile,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.relativeIcon,
              textDesc: S.of(context).relatives,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.languageIcon,
              textDesc:S.of(context).language,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.privacyAndPolicyIcon,
              textDesc: S.of(context).privacy_and_policy,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.aboutUsIcon,
              textDesc:S.of(context).about_us,
              onPressed: () {

              },
            ),
            ProfileListInformation(
              iconUrl: ImageManager.contactUsIcon,
              textDesc: S.of(context).contact_us,
              onPressed: () {

              },
            ),
            BlocProvider(
              create: (context) => getIt<LogoutCubit>(),
              child: BlocListener<LogoutCubit,LogoutStates>(
                listener: (context, state) {
                  state.when(initial:  (){
                    showDialog(context: context, builder:
                        (context) => const Center(child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),),
                    );
                  },
                      loading: (){
                        showDialog(context: context, builder:
                            (context) => const Center(child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),),
                        );
                      },
                      success: (logoutData){
                   LogoutDataModel logoutDataModel = logoutData;

                        context.pop();
                        if(logoutDataModel.status == 200 ) {
                          context.pushNamed(Routes.signInScreen);
                        }
                      },
                      error:(error){

                        setupErrorState(context, error);
                      } );
                },
                child: ProfileListInformation(
                  iconUrl: ImageManager.contactUsIcon,
                  textDesc: S.of(context).logout,
                  onPressed: () {
                 setState(() {
                   context.read<LogoutCubit>().emitLogout();
                 });
                  },
                ),
              ),
            ),
        ],)
      ],
    );
  }
}

