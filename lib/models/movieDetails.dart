import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production.dart';

part 'movieDetails.g.dart';

@JsonSerializable()
class MovieDetails {
  final bool? adult;
  final String? backdrop_path;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final double popularity;
  final String? poster_path;
  final List<Production> production_companies;
  final String? release_date;
  final int revenue;
  final int? runtime;
  final String? title;
  final double vote_average;
  final int? vote_count;
  final bool? video;

  MovieDetails({
    this.adult,
    this.backdrop_path, 
    required this.budget, 
    required this.genres, 
    this.homepage, 
    required this.id, 
    this.original_language, 
    this.original_title, 
    this.overview, 
    required this.popularity, 
    this.poster_path, 
    required this.production_companies, 
    this.release_date, 
    required this.revenue,
    this.runtime,
    this.title,
    required this.vote_average,
    this.vote_count,
    this.video,
  });
  
  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
