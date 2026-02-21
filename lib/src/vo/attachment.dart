import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment with EquatableMixin {
  Attachment(
    this.attachmentId,
    this.createdAt, {
    this.uploadUrl,
    this.viewUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);

  @JsonKey(name: 'attachment_id')
  final String attachmentId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'upload_url')
  final String? uploadUrl;
  @JsonKey(name: 'view_url')
  final String? viewUrl;

  @override
  List<Object?> get props => [
    attachmentId,
    uploadUrl,
    viewUrl,
    createdAt,
  ];
}
