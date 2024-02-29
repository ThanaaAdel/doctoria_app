import 'package:json_annotation/json_annotation.dart';
part 'doctor_model.g.dart';
@JsonSerializable()
class DoctorModel {
  List<DoctorData>? data;
  List<String>? message;
  int? status;

  DoctorModel({this.data, this.message, this.status});
  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

}
@JsonSerializable()
class DoctorData {
  int? id;
  String? name;
  String? nickname;
  String? email;
  String? phone;
  String? gender;
  String? weight;
  String? lang;
  String? image;
  int? isPopular;
  String? location;
  String? about;

  DoctorData(
      {this.id,
        this.name,
        this.nickname,
        this.email,
        this.phone,
        this.gender,
        this.weight,
        this.lang,
        this.image,
        this.isPopular,
        this.location,
        this.about});

  factory DoctorData.fromJson(Map<String, dynamic> json) => _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}
