// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataSlider.fromJson(e as Map<String, dynamic>))
          .toList(),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataSlider _$DataSliderFromJson(Map<String, dynamic> json) => DataSlider(
      id: json['id'] as int?,
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DataSliderToJson(DataSlider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'image': instance.image,
    };
