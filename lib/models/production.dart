import 'package:json_annotation/json_annotation.dart';
part 'production.g.dart';

@JsonSerializable()
class Production{
  final int id;
  final String? logo_path;
  final String name;
  final String? origin_country;

  Production(
    this.id,
    this.logo_path,
    this.name,
    this.origin_country
  );

   
  factory Production.fromJson(Map<String, dynamic> json) => _$ProductionFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProductionToJson(this);
}