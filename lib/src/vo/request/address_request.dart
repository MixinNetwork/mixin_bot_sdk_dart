import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_request.g.dart';

@JsonSerializable()
class AddressRequest with EquatableMixin {
  AddressRequest({
    required this.assetId,
    required this.pin,
    this.destination,
    this.tag,
    this.label,
  });

  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);

  @JsonKey(name: 'asset_id')
  String assetId;
  @JsonKey(name: 'destination')
  String? destination;
  @JsonKey(name: 'tag')
  String? tag;
  @JsonKey(name: 'label')
  String? label;
  @JsonKey(name: 'pin')
  String pin;

  @override
  List<Object?> get props => [
        assetId,
        destination,
        tag,
        label,
        pin,
      ];
}
