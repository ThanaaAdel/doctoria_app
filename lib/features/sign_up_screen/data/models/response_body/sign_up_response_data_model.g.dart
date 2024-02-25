// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseBody _$SignUpResponseBodyFromJson(Map<String, dynamic> json) =>
    SignUpResponseBody(
      data: json['data'] == null
          ? null
          : DataFromSignUpResponseBody.fromJson(
              json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SignUpResponseBodyToJson(SignUpResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataFromSignUpResponseBody _$DataFromSignUpResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DataFromSignUpResponseBody(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as String?,
      postcode: json['postcode'] as String?,
      phone: json['phone'] as String?,
      referCode: json['referCode'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataFromSignUpResponseBodyToJson(
        DataFromSignUpResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'postcode': instance.postcode,
      'phone': instance.phone,
      'referCode': instance.referCode,
      'address': instance.address,
      'image': instance.image,
      'type': instance.type,
      'token': instance.token,
    };
