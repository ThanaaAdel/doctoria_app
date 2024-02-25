import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_body.g.dart';
@JsonSerializable()
class SignInRequestBody{
  final String phone;
  final String password;
  SignInRequestBody({required this.phone,required this.password});

  Map<String , dynamic> toJson() => _$SignInRequestBodyToJson(this);

}
