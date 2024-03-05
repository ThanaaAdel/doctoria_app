// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_accept_details_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingAcceptDetailsResponseBody _$BookingAcceptDetailsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    BookingAcceptDetailsResponseBody(
      data: json['data'] == null
          ? null
          : DataBookingAcceptDetailsResponseBody.fromJson(
              json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$BookingAcceptDetailsResponseBodyToJson(
        BookingAcceptDetailsResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataBookingAcceptDetailsResponseBody
    _$DataBookingAcceptDetailsResponseBodyFromJson(Map<String, dynamic> json) =>
        DataBookingAcceptDetailsResponseBody(
          id: json['id'] as int?,
          type: json['type'] as String?,
          day: json['day'] as String?,
          time: json['time'] as String?,
          desc: json['desc'] as String?,
          price: json['price'] as int?,
          status: json['status'] as String?,
          createdAt: json['createdAt'] as String?,
          mainService: json['mainService'] == null
              ? null
              : MainService.fromJson(
                  json['mainService'] as Map<String, dynamic>),
          patient: json['patient'] == null
              ? null
              : Patient.fromJson(json['patient'] as Map<String, dynamic>),
          docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$DataBookingAcceptDetailsResponseBodyToJson(
        DataBookingAcceptDetailsResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'day': instance.day,
      'time': instance.time,
      'desc': instance.desc,
      'price': instance.price,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'mainService': instance.mainService,
      'patient': instance.patient,
      'docs': instance.docs,
    };

MainService _$MainServiceFromJson(Map<String, dynamic> json) => MainService(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MainServiceToJson(MainService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as String?,
      postcode: json['postcode'] as String?,
      phone: json['phone'] as String?,
      referCode: json['referCode'] as String?,
      address: json['address'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'postcode': instance.postcode,
      'phone': instance.phone,
      'referCode': instance.referCode,
      'address': instance.address,
      'location': instance.location,
      'image': instance.image,
    };
