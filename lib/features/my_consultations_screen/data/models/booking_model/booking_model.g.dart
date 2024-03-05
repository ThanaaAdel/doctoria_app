// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      bookingData: (json['data'] as List<dynamic>?)
          ?.map((e) => BookingData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'data': instance.bookingData,
      'message': instance.message,
      'status': instance.status,
    };

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
      id: json['id'] as int?,
      type: json['type'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      desc: json['desc'] as String?,
      price: json['price'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      patient: json['patient'] == null
          ? null
          : BookingPatientData.fromJson(
              json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'day': instance.day,
      'time': instance.time,
      'desc': instance.desc,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt,
      'patient': instance.patient,
    };

BookingPatientData _$BookingPatientDataFromJson(Map<String, dynamic> json) =>
    BookingPatientData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as String?,
      postcode: json['postcode'] as String?,
      phone: json['phone'] as String?,
      referCode: json['refer_code'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BookingPatientDataToJson(BookingPatientData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'postcode': instance.postcode,
      'phone': instance.phone,
      'refer_code': instance.referCode,
      'address': instance.address,
      'image': instance.image,
    };
