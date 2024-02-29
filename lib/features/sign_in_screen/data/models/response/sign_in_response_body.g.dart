// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseBody _$SignInResponseBodyFromJson(Map<String, dynamic> json) =>
    SignInResponseBody(
      data: json['data'] == null
          ? null
          : DataFromSignIn.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SignInResponseBodyToJson(SignInResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataFromSignIn _$DataFromSignInFromJson(Map<String, dynamic> json) =>
    DataFromSignIn(
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
    )
      ..weight = json['weight'] as String?
      ..lang = json['lang'] as String?
      ..image = json['image'] as String?
      ..location = json['location'] as String?
      ..type = json['type'] as String?;

Map<String, dynamic> _$DataFromSignInToJson(DataFromSignIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'postcode': instance.postcode,
      'weight': instance.weight,
      'lang': instance.lang,
      'image': instance.image,
      'location': instance.location,
      'type': instance.type,
      'phone': instance.phone,
      'refer_code': instance.referCode,
      'address': instance.address,
      'token': instance.token,
    };
