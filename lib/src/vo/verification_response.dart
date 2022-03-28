import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_response.g.dart';

@JsonSerializable()
class VerificationResponse extends Equatable {
  const VerificationResponse({
    required this.type,
    required this.id,
    this.hasEmergencyContact = false,
    this.contactId,
    this.deactivatedAt,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'has_emergency_contact')
  final bool hasEmergencyContact;

  @JsonKey(name: 'contact_id')
  final String? contactId;

  @JsonKey(name: 'deactivated_at')
  final String? deactivatedAt;

  @override
  List<Object?> get props => [
        type,
        id,
        hasEmergencyContact,
        contactId,
        deactivatedAt,
      ];

  Map<String, dynamic> toJson() => _$VerificationResponseToJson(this);
}
