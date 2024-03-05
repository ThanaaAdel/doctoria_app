
import 'package:json_annotation/json_annotation.dart';
part 'logout_model.g.dart';
@JsonSerializable()
class LogoutDataModel {
  String? data;
  List<String>? message;
  int? status;

  LogoutDataModel({this.data, this.message, this.status});
  factory LogoutDataModel.fromJson(Map<String, dynamic> json) => _$LogoutDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutDataModelToJson(this);
}