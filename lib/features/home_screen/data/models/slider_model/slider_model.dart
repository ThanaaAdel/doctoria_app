import 'package:json_annotation/json_annotation.dart';
part 'slider_model.g.dart';
@JsonSerializable()
class SliderModel {
  List<DataSlider>? data;
  List<String>? message;
  int? status;

  SliderModel({this.data, this.message, this.status});
  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);

}
@JsonSerializable()
class DataSlider {
  int? id;
  String? name;
  String? desc;
  String? image;

  DataSlider({this.id, this.name, this.desc, this.image});
  factory DataSlider.fromJson(Map<String, dynamic> json) => _$DataSliderFromJson(json);

  Map<String, dynamic> toJson() => _$DataSliderToJson(this);

}

