import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consumer.g.dart';

@JsonSerializable()
class Consumer {
  Consumer({
    @required this.name,
    @required this.pick,
    @required this.payment,
  });

  final String name;
  final String pick;
  final String payment;

  factory Consumer.fromJson(Map<String, dynamic> json) =>
      _$ConsumerFromJson(json);
  Map<String, dynamic> toJson() => _$ConsumerToJson(this);
}
