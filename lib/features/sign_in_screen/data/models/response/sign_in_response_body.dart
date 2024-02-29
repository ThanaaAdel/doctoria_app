import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response_body.g.dart';
@JsonSerializable()
class SignInResponseBody {
  DataFromSignIn? data;
  List<String>? message;
  int? status;

  SignInResponseBody({this.data, this.message, this.status});
  factory SignInResponseBody.fromJson(Map<String, dynamic> json) => _$SignInResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignInResponseBodyToJson(this);
}
@JsonSerializable()
class DataFromSignIn {
  int? id;
  String? name;
  String? email;
  String? nickname;
  String? gender;
  String? postcode;
  String? weight;
  String? lang;
  String? image;
  String? location;
  String? type;
  String? phone;
  @JsonKey(name: "refer_code")
  String? referCode;
  String? address;
  String? token;

  DataFromSignIn(
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
  factory DataFromSignIn.fromJson(Map<String, dynamic> json) => _$DataFromSignInFromJson(json);

  Map<String, dynamic> toJson() => _$DataFromSignInToJson(this);
}
