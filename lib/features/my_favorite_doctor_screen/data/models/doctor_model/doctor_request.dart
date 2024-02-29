import 'package:json_annotation/json_annotation.dart';
part 'doctor_request.g.dart';
@JsonSerializable()
class DoctorRequestData{
  @JsonKey(name: "category_id")
  final int  category_id;
  DoctorRequestData({required this.category_id});
  Map<String , dynamic> toJson() => _$DoctorRequestDataToJson(this);

}
