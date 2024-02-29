import 'package:doctoria_app/core/theming/colors.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/data/models/doctor_model/doctor_model.dart';
import 'package:doctoria_app/features/my_favorite_doctor_screen/logic/doctor_cubit/doctor_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/doctor_cubit/doctor_cubit.dart';
import 'doctor_widget.dart';
import 'no_doctor_founded_widget.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({super.key, required this.categoryId});
final int categoryId;
  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  @override
  void initState() {
    context.read<DoctorCubit>().emitDoctorData(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit,DoctorStates>(
      builder: ( context, state) {
        return state.when(
          initial: () {
            return const Center(
                child: CircularProgressIndicator(
                    color: ColorsManager.colorSplash));
          },
          loading: () {
            return const Center(
                child: CircularProgressIndicator(
                    color: ColorsManager.colorSplash));
          },
          success: (data) {
            final DoctorModel doctorModel = data;

            if (doctorModel.data != null && doctorModel.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: doctorModel.data!.length,
                itemBuilder: (context, index) => DoctorWidget(
                  doctorId: doctorModel.data![index].id!.toInt(),
                  imageLink: doctorModel.data![index].image.toString(),
                  doctorName: doctorModel.data![index].name.toString(),
                ),
              );
            } else {
              return const NoDoctorFoundedWidget();
            }
          },
          error: (error) {
            return Center(child: Text(error));
          },
        );
      },

    );
  }
}

