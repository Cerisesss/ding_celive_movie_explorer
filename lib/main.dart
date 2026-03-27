import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
   
import 'models/movie.dart';
import 'models/post.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie explorer")),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]); 
        },
      )
    );
  }

  Future _fetchPost() async {
    final String? apiKey = dotenv.env['API_KEY'];

    final uri = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$apiKey");
    final response = await http.get(
      uri,
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;

      setState(() {
        movies = results.map((movie) => Movie.fromJson(movie)).toList();
      });
    }
  }
}


// class _MyHomePageState extends State<MyHomePage> {
// final List<Movie> movies = [
//   Movie("Inception", "2010", "https://m.media-amazon.com/images/M/MV5BZjhkNjM0ZTMtNGM5MC00ZTQ3LTk3YmYtZTkzYzdiNWE0ZTA2XkEyXkFqcGc@._V1_.jpg", "Un voleur qui infiltre les rêves pour voler des secrets."),
//   Movie("Interstellar", "2014", "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg", "Exploration spatiale pour sauver l’humanité."),
//   Movie("The Dark Knight", "2008", "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg", "Batman affronte le Joker.",),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Movie explorer")),
//       body: ListView.builder(
//         itemCount: movies.length,
//         itemBuilder: (context, index) {
//           return MovieCard(movie: movies[index]); 
//         },
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
        
//       }, child: Icon(Icons.home)),
       
//     );
//   }
// }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ListView.separated(
  //       itemCount: posts.length,
  //       separatorBuilder: (context, index) => const Divider(),
  //       itemBuilder: (context, index) {
  //         final post = posts[index];

  //         return ListTile(
  //           title: Text(post.title),
  //         );
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(onPressed: () {
  //     }, child: Icon(Icons.refresh)),
  //   );
  // }