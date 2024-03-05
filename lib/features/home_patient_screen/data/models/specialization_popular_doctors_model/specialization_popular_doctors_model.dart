import 'package:json_annotation/json_annotation.dart';
part 'specialization_popular_doctors_model.g.dart';
@JsonSerializable()
class SpecializationPopularDoctorsModel {
  List<DataFromSpecializationPopularDoctors>? data;
  List<String>? message;
  int? status;

  SpecializationPopularDoctorsModel({this.data, this.message, this.status});
  factory SpecializationPopularDoctorsModel.fromJson(Map<String, dynamic> json) => _$SpecializationPopularDoctorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationPopularDoctorsModelToJson(this);
}
@JsonSerializable()
class DataFromSpecializationPopularDoctors {
  int? id;
  String? name;
  String? color;
  String? icon;
  String? image;
  List<LimitPopularDoctors>? limitPopularDoctors;

  DataFromSpecializationPopularDoctors(
      {this.id,
        this.name,
        this.color,
        this.icon,
        this.image,
        this.limitPopularDoctors});
  factory DataFromSpecializationPopularDoctors.fromJson(Map<String, dynamic> json) => _$DataFromSpecializationPopularDoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$DataFromSpecializationPopularDoctorsToJson(this);
}
@JsonSerializable()
class LimitPopularDoctors {
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

  LimitPopularDoctors(
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
  factory LimitPopularDoctors.fromJson(Map<String, dynamic> json) => _$LimitPopularDoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$LimitPopularDoctorsToJson(this);
}