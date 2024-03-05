// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutDataModel _$LogoutDataModelFromJson(Map<String, dynamic> json) =>
    LogoutDataModel(
      data: json['data'] as String?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$LogoutDataModelToJson(LogoutDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
