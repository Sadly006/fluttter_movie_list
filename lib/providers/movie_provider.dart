import 'package:flutter/foundation.dart';
import 'package:flutter_movie_list/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  final String apiUrl =
      "https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies";

  List<Movie> get movies => [..._movies];

  Future<void> fetchMovies() async {
    try {
      final List<dynamic> data = await fetchDataFromApi();
      _movies = data.map((json) => Movie.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<List<dynamic>> fetchDataFromApi() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  void likeMovie(int index) {
    _movies[index].isLiked = true;
    notifyListeners();
  }

  void dislikeMovie(int index) {
    _movies[index].isLiked = false;
    notifyListeners();
  }
}
