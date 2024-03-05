import 'package:json_annotation/json_annotation.dart';

part 'booking_accept_request_model.g.dart';
@JsonSerializable()
class BookingAcceptRequestBody{
  @JsonKey(name: "booking_id")
  final int bookingId;

  BookingAcceptRequestBody({required this.bookingId});

  Map<String , dynamic> toJson() => _$BookingAcceptRequestBodyToJson(this);

}
