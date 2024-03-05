import 'package:json_annotation/json_annotation.dart';
part 'booking_accept_details_response_body_model.g.dart';
@JsonSerializable()
class BookingAcceptDetailsResponseBody {
  DataBookingAcceptDetailsResponseBody? data;
  List<String>? message;
  int? status;

  BookingAcceptDetailsResponseBody({this.data, this.message, this.status});
  factory BookingAcceptDetailsResponseBody.fromJson(Map<String, dynamic> json) => _$BookingAcceptDetailsResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$BookingAcceptDetailsResponseBodyToJson(this);
}
@JsonSerializable()
class DataBookingAcceptDetailsResponseBody {
  int? id;
  String? type;
  String? day;
  String? time;
  String? desc;
  int? price;
  String? status;
  String? createdAt;
  MainService? mainService;
  Patient? patient;
  List<String>? docs;

  DataBookingAcceptDetailsResponseBody(
      {this.id,
        this.type,
        this.day,
        this.time,
        this.desc,
        this.price,
        this.status,
        this.createdAt,
        this.mainService,
        this.patient,
        this.docs});
  factory DataBookingAcceptDetailsResponseBody.fromJson(Map<String, dynamic> json) => _$DataBookingAcceptDetailsResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DataBookingAcceptDetailsResponseBodyToJson(this);
}
@JsonSerializable()
class MainService {
  int? id;
  String? name;
  String? slug;
  String? image;

  MainService({this.id, this.name, this.slug, this.image});
  factory MainService.fromJson(Map<String, dynamic> json) => _$MainServiceFromJson(json);
  Map<String, dynamic> toJson() => _$MainServiceToJson(this);

}
@JsonSerializable()
class Patient {
  int? id;
  String? name;
  String? email;
  String? nickname;
  String? gender;
  String? postcode;
  String? phone;
  String? referCode;
  String? address;
  String? location;
  String? image;

  Patient(
      {this.id,
        this.name,
        this.email,
        this.nickname,
        this.gender,
        this.postcode,
        this.phone,
        this.referCode,
        this.address,
        this.location,
        this.image});

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
  Map<String, dynamic> toJson() => _$PatientToJson(this);
}