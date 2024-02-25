import 'package:doctoria_app/features/home_screen/data/models/slider_model/slider_model.dart';
import 'package:doctoria_app/features/home_screen/data/repos/home_slider_repo.dart';
import 'package:doctoria_app/features/home_screen/logic/cubits/slider_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderCubitStates<SliderModel>> {
  final SliderRepo sliderRepo;
  SliderCubit(this.sliderRepo) : super(const SliderCubitStates.initial());
 late SliderModel sliderModel;
  void emitSignInStates() async {
    emit(const SliderCubitStates.loading());
    final response = await sliderRepo.homeSlider();
    response.when(success: (sliderData) {

      emit(SliderCubitStates.success(sliderData));
      print("sliderData$sliderData");
      print("sliderModel$sliderModel");
      sliderModel = sliderData;
    }, failure: (error) {
      emit(SliderCubitStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
