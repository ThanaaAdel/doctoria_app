// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_patient_response_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientResponseBody _$PatientResponseBodyFromJson(Map<String, dynamic> json) =>
    PatientResponseBody(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$PatientResponseBodyToJson(
        PatientResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as String?,
      postcode: json['postcode'] as String?,
      phone: json['phone'] as String?,
      referCode: json['refer_code'] as String?,
      address: json['address'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'postcode': instance.postcode,
      'phone': instance.phone,
      'refer_code': instance.referCode,
      'address': instance.address,
      'token': instance.token,
    };
