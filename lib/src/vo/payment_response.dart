import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum_converter.dart';

part 'payment_response.g.dart';

@JsonSerializable()
@PaymentStatusJsonConverter()
class PaymentResponse with EquatableMixin {
  PaymentResponse({required this.status});

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);

  @JsonKey(name: 'status')
  PaymentStatus status;

  @override
  List<Object> get props => [status];
}

enum PaymentStatus {
  pending,
  paid,
}

class PaymentStatusJsonConverter extends EnumJsonConverter<PaymentStatus> {
  const PaymentStatusJsonConverter();
  @override
  List<PaymentStatus> enumValues() => PaymentStatus.values;
}
