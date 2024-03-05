
import 'package:json_annotation/json_annotation.dart';
part 'booking_accept_model.g.dart';
@JsonSerializable()
class BookingAcceptModel {
  String? data;
  List<String>? message;
  int? status;

  BookingAcceptModel({this.data, this.message, this.status});
  factory BookingAcceptModel.fromJson(Map<String, dynamic> json) => _$BookingAcceptModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingAcceptModelToJson(this);
}