// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(
    quantity: json['quantity'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    item: json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'location': instance.location,
      'quantity': instance.quantity,
      'item': instance.item,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
