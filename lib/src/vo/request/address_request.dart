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
  final String assetId;
  @JsonKey(name: 'destination')
  final String? destination;
  @JsonKey(name: 'tag')
  final String? tag;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'pin')
  final String pin;

  @override
  List<Object?> get props => [
        assetId,
        destination,
        tag,
        label,
        pin,
      ];
}
