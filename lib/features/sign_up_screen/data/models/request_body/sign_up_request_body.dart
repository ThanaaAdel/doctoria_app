import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignUpRequestBody {
  String phone;
  String password;
  String? confirmPassword;
  String? referralCode;

  SignUpRequestBody({required this.password, this.confirmPassword, this.referralCode,required this.phone});
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);

}
