import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
   
import 'models/movie.dart';
import 'widgets/MovieCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  try {
    await dotenv.load(fileName: ".env"); 
  } catch (e) {
    throw Exception('Error loading .env file: $e'); 
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
} 

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> movies = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    _fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie explorer")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: 'Rechercher un film...',
              onChanged: (String query) async {
                if(query == null || query.isEmpty){
                  return _fetchPost();
                } 
                await _searchMovies(query);
              },
            ),
          ),
          Expanded(
            child : movies.isEmpty
            ? const Text('No movies available')
            : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]); 
              },
            ),
          ),
        ],
      ),
    );
  }

  Future _fetchPost() async {
    final String? apiKey = dotenv.env['API_KEY'];

    final uri = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$apiKey");
    final response = await http.get(
      uri,
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        setState(() {
          movies = results.map((movie) => Movie.fromJson(movie)).toList();
          movieLocalStorage(movies);
        });
      } 
    }catch (e){
      throw Exception('Error : $e');
    }
  }

  Future _searchMovies(String query) async {
    if(query.isEmpty){
      return;
    } 

    final String? apiKey = dotenv.env['API_KEY'];

    final uri = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query");
    final response = await http.get(
      uri,
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );

    try{
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;
        setState(() {
          movies = results.map((movie) => Movie.fromJson(movie)).toList();
          movieLocalStorage(movies); 
        });
      }
    }catch (e){
      throw Exception('Error : $e');
    }
  }

  Future<void> movieLocalStorage(List<Movie> movies) async {
    final save = await SharedPreferences.getInstance();
    List<String> moviesJson = movies.map((movie) => jsonEncode(movie.toJson())).toList();
    await save.setStringList('saved_movies', moviesJson);
  }

  Future<List<Movie>> loadMoviesLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final moviesJson = prefs.getStringList('saved_movies') ?? [];

    return moviesJson.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
  }

  Future<void> loadMovies() async {
    List<Movie> storedMovies = await loadMoviesLocalStorage();

    if (storedMovies.isNotEmpty) {
      setState(() {
        movies = storedMovies;
      });
    } else {
      _fetchPost();
    }
  }
}