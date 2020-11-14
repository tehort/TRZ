import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trz/models/enums/gender.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person({
    this.id,
    @required this.name,
    @required this.age,
    @required this.gender,
    this.location,
    this.lonlat,
    this.created_at,
    this.updated_at,
    this.infected,
  });

  String id;
  final String location;
  final String name;
  final int age;
  final bool infected;
  final String created_at;
  final String updated_at;

  @JsonKey(fromJson: _tipoFromChar, toJson: _tipoFromEnum)
  final Gender gender;

  static String _tipoFromEnum(Gender tipo) => tipo == null ? null : tipo.enumToChar();

  static Gender _tipoFromChar(String val) {
    if (val == 'M') {
      return Gender.male;
    } else if (val == 'F') {
      return Gender.female;
    } else {
      return null;
    }
  }

  @JsonKey(fromJson: _coordsFromApi, toJson: _coordsToApi)
  final LatLng lonlat;
  static String _coordsToApi(LatLng val) {
    if (val == null) return null;
    return 'Point(${val.longitude.toStringAsFixed(4)} ${val.latitude.toStringAsFixed(4)})';
  }

  static LatLng _coordsFromApi(String val) {
    if (val == null) return null;

    final str = val
        .replaceAll(
          'Point',
          '',
        )
        .replaceAll(')', '')
        .replaceAll('(', '')
        .split(' ');

    return LatLng(double.parse('${str[str.length - 1]}'), double.parse('${str[str.length - 2]}'));
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
