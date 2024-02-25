import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response_data_model.g.dart';
@JsonSerializable()
class SignUpResponseBody {
  DataFromSignUpResponseBody? data;
  List<String>? message;
  int? status;

  SignUpResponseBody({this.data, this.message, this.status});
  factory SignUpResponseBody.fromJson(Map<String, dynamic> json) => _$SignUpResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseBodyToJson(this);

}
@JsonSerializable()
class DataFromSignUpResponseBody {
  int? id;
  String? name;
  String? email;
  String? nickname;
  String? gender;
  String? postcode;
  String? phone;
  String? referCode;
  String? address;
  String? image;
  String? type;
  String? token;

  DataFromSignUpResponseBody(
      {this.id,
        this.name,
        this.email,
        this.nickname,
        this.gender,
        this.postcode,
        this.phone,
        this.referCode,
        this.address,
        this.image,
        this.type,
        this.token});

  factory DataFromSignUpResponseBody.fromJson(Map<String, dynamic> json) => _$DataFromSignUpResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DataFromSignUpResponseBodyToJson(this);
}