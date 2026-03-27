import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie.dart';
import 'MovieDetailsCard.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final String? apiUrlImg = dotenv.env['API_IMG_URL'];

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        minVerticalPadding: 20,
        leading: Image.network(
          "$apiUrlImg${movie.poster_path}",
          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ),
        title: Text(
          movie.title, 
          style: const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold
            ),
        ),
        subtitle: Text(movie.overview),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsCard(movie: movie),
            ),
          );
        },
      ),
    );
  }
}