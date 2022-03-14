import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_update_request.g.dart';

@JsonSerializable()
class AccountUpdateRequest with EquatableMixin {
  AccountUpdateRequest({
    this.fullName,
    this.avatarBase64,
    this.receiveMessageSource,
    this.acceptConversationSource,
    this.acceptSearchSource,
    this.biography,
    this.fiatCurrency,
    this.transferNotificationThreshold,
    this.transferConfirmationThreshold,
  });

  factory AccountUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateRequestFromJson(json);

  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'avatar_base64')
  final String? avatarBase64;
  @JsonKey(name: 'receive_message_source')
  final String? receiveMessageSource;
  @JsonKey(name: 'accept_conversation_source')
  final String? acceptConversationSource;
  @JsonKey(name: 'accept_search_source')
  final String? acceptSearchSource;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'fiat_currency')
  final String? fiatCurrency;
  @JsonKey(name: 'transfer_notification_threshold')
  final double? transferNotificationThreshold;
  @JsonKey(name: 'transfer_confirmation_threshold')
  final double? transferConfirmationThreshold;

  @override
  List<Object?> get props => [
        fullName,
        avatarBase64,
        receiveMessageSource,
        acceptConversationSource,
        acceptSearchSource,
        biography,
        fiatCurrency,
        transferNotificationThreshold,
        transferConfirmationThreshold,
      ];

  Map<String, dynamic> toJson() => _$AccountUpdateRequestToJson(this);
}
