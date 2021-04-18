import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment with EquatableMixin {
  @JsonKey(name: 'attachment_id')
  String attachmentId;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'upload_url')
  String? uploadUrl;
  @JsonKey(name: 'view_url')
  String? viewUrl;

  Attachment(
    this.attachmentId,
    this.createdAt, {
    this.uploadUrl,
    this.viewUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);

  @override
  List<Object?> get props => [
        attachmentId,
        uploadUrl,
        viewUrl,
        createdAt,
      ];
}
