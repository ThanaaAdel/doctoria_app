// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_popular_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationPopularDoctorsModel _$SpecializationPopularDoctorsModelFromJson(
        Map<String, dynamic> json) =>
    SpecializationPopularDoctorsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataFromSpecializationPopularDoctors.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SpecializationPopularDoctorsModelToJson(
        SpecializationPopularDoctorsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataFromSpecializationPopularDoctors
    _$DataFromSpecializationPopularDoctorsFromJson(Map<String, dynamic> json) =>
        DataFromSpecializationPopularDoctors(
          id: json['id'] as int?,
          name: json['name'] as String?,
          color: json['color'] as String?,
          icon: json['icon'] as String?,
          image: json['image'] as String?,
          limitPopularDoctors: (json['limitPopularDoctors'] as List<dynamic>?)
              ?.map((e) =>
                  LimitPopularDoctors.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$DataFromSpecializationPopularDoctorsToJson(
        DataFromSpecializationPopularDoctors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'icon': instance.icon,
      'image': instance.image,
      'limitPopularDoctors': instance.limitPopularDoctors,
    };

LimitPopularDoctors _$LimitPopularDoctorsFromJson(Map<String, dynamic> json) =>
    LimitPopularDoctors(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      weight: json['weight'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as String?,
      isPopular: json['isPopular'] as int?,
      location: json['location'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$LimitPopularDoctorsToJson(
        LimitPopularDoctors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'weight': instance.weight,
      'lang': instance.lang,
      'image': instance.image,
      'isPopular': instance.isPopular,
      'location': instance.location,
      'about': instance.about,
    };
