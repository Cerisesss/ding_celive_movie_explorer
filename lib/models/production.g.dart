// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Production _$ProductionFromJson(Map<String, dynamic> json) => Production(
  (json['id'] as num).toInt(),
  json['logo_path'] as String?,
  json['name'] as String,
  json['origin_country'] as String?,
);

Map<String, dynamic> _$ProductionToJson(Production instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logo_path,
      'name': instance.name,
      'origin_country': instance.origin_country,
    };
