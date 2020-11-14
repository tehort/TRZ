// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    id: json['id'] as String,
    name: json['name'] as String,
    age: json['age'] as int,
    gender: Person._tipoFromChar(json['gender'] as String),
    location: json['location'] as String,
    lonlat: Person._coordsFromApi(json['lonlat'] as String),
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    infected: json['infected'] as bool,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'name': instance.name,
      'age': instance.age,
      'infected': instance.infected,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'gender': Person._tipoFromEnum(instance.gender),
      'lonlat': Person._coordsToApi(instance.lonlat),
    };
