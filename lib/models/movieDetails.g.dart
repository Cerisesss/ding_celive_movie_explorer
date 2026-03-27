// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
  adult: json['adult'] as bool,
  backdrop_path: json['backdrop_path'] as String,
  budget: (json['budget'] as num).toInt(),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  homepage: json['homepage'] as String,
  id: (json['id'] as num).toInt(),
  original_language: json['original_language'] as String,
  original_title: json['original_title'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  poster_path: json['poster_path'] as String,
  production_companies: (json['production_companies'] as List<dynamic>)
      .map((e) => Production.fromJson(e as Map<String, dynamic>))
      .toList(),
  release_date: json['release_date'] as String,
  revenue: (json['revenue'] as num).toInt(),
  runtime: (json['runtime'] as num).toInt(),
  title: json['title'] as String,
  vote_average: (json['vote_average'] as num).toDouble(),
  vote_count: (json['vote_count'] as num).toInt(),
  video: json['video'] as bool,
);

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'production_companies': instance.production_companies,
      'release_date': instance.release_date,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'title': instance.title,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
      'video': instance.video,
    };
