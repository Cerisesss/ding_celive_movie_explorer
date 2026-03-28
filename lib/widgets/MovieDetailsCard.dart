import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie.dart';
import '../models/movieDetails.dart';

class MovieDetailsCard extends StatefulWidget {
  final Movie movie;

  const MovieDetailsCard({super.key, required this.movie});

  @override
  State<MovieDetailsCard> createState() => _MovieDetailsCardState();

}

class _MovieDetailsCardState extends State<MovieDetailsCard> {
  MovieDetails? movieDetails;

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }
 
 @override
  Widget build(BuildContext context) {
    final String? apiUrlImg = dotenv.env['API_IMG_URL'];

    if (movieDetails == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(movieDetails!.title ?? 'Details du film')),
      body: Row(
        children: [
          Image.network(
            movieDetails!.poster_path != null
                ? "$apiUrlImg${movieDetails!.poster_path}"
                : '',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movieDetails!.title ?? 'Titre inconnu'} (${movieDetails!.original_title ?? 'Titre original inconnu'})",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Lien : ${movieDetails!.homepage ?? '/'}"),
                  Text("Genres : ${movieDetails!.genres.map((e) => e.name).join(', ')}"),
                  Text("Langue : ${movieDetails!.original_language ?? '/'}"),
                  Text("Date : ${movieDetails!.release_date ?? '/'}"),
                  Text("Popularité : ${movieDetails!.popularity}"),
                  Text("Budget : ${movieDetails!.budget}"),
                  Text("Revenue : ${movieDetails!.revenue}"),
                  Text("Compagnie de production : ${movieDetails!.production_companies.map((e) => e.name).join(', ')}"),
                  Text("Note : ${movieDetails!.vote_average}"),
                  Text(movieDetails!.overview ?? 'Aucun résumé disponible'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future fetchMovieDetails() async {
    final String? apiKey = dotenv.env['API_KEY'];

    final uri = Uri.parse("https://api.themoviedb.org/3/movie/${widget.movie.id}?api_key=$apiKey");
    final response = await http.get(
      uri,
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );

    try{
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          movieDetails  = MovieDetails.fromJson(data);
        });
      }
    }catch (e){
      throw Exception('Error : $e');
    }
  }
}