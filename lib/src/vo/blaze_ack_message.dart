import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blaze_ack_message.g.dart';

@JsonSerializable()
class BlazeAckMessage with EquatableMixin {
  @JsonKey(name: 'message_id', nullable: false)
  String messageId;
  @JsonKey(name: 'status', nullable: false)
  String status;

  BlazeAckMessage({this.messageId, this.status});

  factory BlazeAckMessage.fromJson(Map<String, dynamic> json) =>
      _$BlazeAckMessageFromJson(json);

  Map<String, dynamic> toJson() => _$BlazeAckMessageToJson(this);

  @override
  List<Object> get props => [messageId, status];
}
