// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
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

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
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
