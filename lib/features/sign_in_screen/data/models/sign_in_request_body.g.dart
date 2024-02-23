// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestBody _$SignInRequestBodyFromJson(Map<String, dynamic> json) =>
    SignInRequestBody(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestBodyToJson(SignInRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };
