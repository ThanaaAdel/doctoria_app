// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_accept_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingAcceptModel _$BookingAcceptModelFromJson(Map<String, dynamic> json) =>
    BookingAcceptModel(
      data: json['data'] as String?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$BookingAcceptModelToJson(BookingAcceptModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
