import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blaze_ack_message.g.dart';

@JsonSerializable()
class BlazeAckMessage with EquatableMixin {

  BlazeAckMessage({
    required this.messageId,
    required this.status,
  });

  factory BlazeAckMessage.fromJson(Map<String, dynamic> json) =>
      _$BlazeAckMessageFromJson(json);

  Map<String, dynamic> toJson() => _$BlazeAckMessageToJson(this);

  @JsonKey(name: 'message_id')
  String messageId;
  @JsonKey(name: 'status')
  String status;

  @override
  List<Object> get props => [
        messageId,
        status,
      ];
}
