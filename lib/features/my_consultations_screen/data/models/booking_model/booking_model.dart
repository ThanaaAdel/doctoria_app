import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';
@JsonSerializable()
class BookingModel {
  @JsonKey(name: "data")
  List<BookingData>? bookingData;
  List<String>? message;
  int? status;

  BookingModel({this.bookingData, this.message, this.status});
  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
@JsonSerializable()
class BookingData {
  int? id;
  String? type;
  String? day;
  String? time;
  String? desc;
  int? price;
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  BookingPatientData? patient;

  BookingData(
      {this.id,
        this.type,
        this.day,
        this.time,
        this.desc,
        this.price,
        this.status,
        this.createdAt,
        this.patient});
  factory BookingData.fromJson(Map<String, dynamic> json) => _$BookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataToJson(this);

}
@JsonSerializable()
class BookingPatientData {
  int? id;
  String? name;
  String? email;
  String? nickname;
  String? gender;
  String? postcode;
  String? phone;
  @JsonKey(name: "refer_code")
  String? referCode;
  String? address;
  String? image;

  BookingPatientData(
      {this.id,
        this.name,
        this.email,
        this.nickname,
        this.gender,
        this.postcode,
        this.phone,
        this.referCode,
        this.address,
        this.image});

  factory BookingPatientData.fromJson(Map<String, dynamic> json) => _$BookingPatientDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookingPatientDataToJson(this);



}