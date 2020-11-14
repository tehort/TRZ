import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trz/models/enums/items_enum.dart';
import 'package:trz/models/item.dart';
import 'package:validators/validators.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  Property({
    @required this.quantity,
    this.created_at,
    this.updated_at,
    @required this.item,
    this.location,
  });

  final String location;
  int quantity;
  final Item item;
  final String created_at;
  final String updated_at;

  static List<Property> itemsList() {
    return [
      for (var item in ItemsEnum.values)
        Property(
          quantity: 0,
          item: Item(name: item.description, points: item.points),
        ),
    ];
  }

  static String toApiFormat(List<Property> items) {
    var itemsDescription = '';
    for (final item in items) {
      itemsDescription =
          itemsDescription + '${item.item.name}:${item.quantity};';
    }

    if (!isNull(itemsDescription)) {
      itemsDescription =
          itemsDescription.substring(0, itemsDescription.length - 1);
    }

    return itemsDescription;
  }

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}
