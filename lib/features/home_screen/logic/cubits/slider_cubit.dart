import '../../data/repos/home_slider_repo.dart';
import 'slider_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderCubitStates> {
  final SliderRepo sliderRepo;
  SliderCubit(this.sliderRepo) : super(const SliderCubitStates.initial());
  void emitSlider() async {
    emit(const SliderCubitStates.loading());
    final response = await sliderRepo.homeSlider();
    response.when(success: (sliderData) {
      emit(SliderCubitStates.success(sliderData));
    }, failure: (error) {
      emit(SliderCubitStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
