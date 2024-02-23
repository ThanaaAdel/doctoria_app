import 'package:json_annotation/json_annotation.dart';
part 'api_patient_response_sign_in.g.dart';
@JsonSerializable()
class PatientResponseBody {
  Data? data;
  List<String>? message;
  int? status;

  PatientResponseBody({this.data, this.message, this.status});
  factory PatientResponseBody.fromJson(Map<String, dynamic> json) => _$PatientResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseBodyToJson(this);
}
@JsonSerializable()
class Data {
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
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.nickname,
        this.gender,
        this.postcode,
        this.phone,
        this.referCode,
        this.address,
        this.token});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
