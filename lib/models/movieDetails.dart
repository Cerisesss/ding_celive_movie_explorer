import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production.dart';

part 'movieDetails.g.dart';

@JsonSerializable()
class MovieDetails {
  final bool adult;
  final String backdrop_path;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Production> production_companies;
  final String release_date;
  final int revenue;
  final int runtime;
  final String title;
  final double vote_average;
  final int vote_count;
  final bool video;

  MovieDetails({
    required this.adult,
    required this.backdrop_path, 
    required this.budget, 
    required this.genres, 
    required this.homepage, 
    required this.id, 
    required this.original_language, 
    required this.original_title, 
    required this.overview, 
    required this.popularity, 
    required this.poster_path, 
    required this.production_companies, 
    required this.release_date, 
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.vote_average,
    required this.vote_count,
    required this.video,
  });
  
  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
