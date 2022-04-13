import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blaze_ack_message.g.dart';

@JsonSerializable()
class BlazeAckMessage with EquatableMixin {
  BlazeAckMessage({
    required this.messageId,
    required this.status,
    required this.expireAt,
  });

  factory BlazeAckMessage.fromJson(Map<String, dynamic> json) =>
      _$BlazeAckMessageFromJson(json);

  Map<String, dynamic> toJson() => _$BlazeAckMessageToJson(this);

  @JsonKey(name: 'message_id')
  String messageId;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'expire_at')
  int? expireAt;

  @override
  List<Object?> get props => [
        messageId,
        status,
        expireAt,
      ];
}
