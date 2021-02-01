import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attchment with EquatableMixin {
  @JsonKey(name: 'attachment_id', nullable: false)
  String attachmentId;
  @JsonKey(name: 'upload_url')
  String uploadUrl;
  @JsonKey(name: 'view_url')
  String viewUrl;

  Attchment(this.attachmentId, {this.uploadUrl, this.viewUrl});

  factory Attchment.fromJson(Map<String, dynamic> json) =>
      _$AttchmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttchmentToJson(this);

  @override
  List<Object> get props => [attachmentId, uploadUrl, viewUrl];
}
