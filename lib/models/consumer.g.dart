// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumer _$ConsumerFromJson(Map<String, dynamic> json) {
  return Consumer(
    name: json['name'] as String,
    pick: json['pick'] as String,
    payment: json['payment'] as String,
  );
}

Map<String, dynamic> _$ConsumerToJson(Consumer instance) => <String, dynamic>{
      'name': instance.name,
      'pick': instance.pick,
      'payment': instance.payment,
    };
