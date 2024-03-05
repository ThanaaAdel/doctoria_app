import 'package:json_annotation/json_annotation.dart';
part 'booking_accept_details_request.g.dart';
@JsonSerializable()
class BookingAcceptDetailsRequestBody {
  @JsonKey(name: "booking_id")
  int bookingId;

  BookingAcceptDetailsRequestBody({required this.bookingId});
  Map<String, dynamic> toJson() => _$BookingAcceptDetailsRequestBodyToJson(this);

}
