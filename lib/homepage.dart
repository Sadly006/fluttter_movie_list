import 'package:flutter/material.dart';
import 'package:flutter_movie_list/providers/movie_provider.dart';
import 'package:flutter_movie_list/widgets/movie_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 34, 67),
      appBar: AppBar(
        title: const Text('Movie List'),
        backgroundColor: const Color.fromARGB(255, 36, 34, 67),
      ),
      body: FutureBuilder(
        future:
            _fetchMoviesOnce(context), // Use a function to fetch movies once
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const MovieListWidget(); // No need to pass movies here
          }
        },
      ),
    );
  }

  // Function to fetch movies once and return a future
  Future<void> _fetchMoviesOnce(BuildContext context) async {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    await movieProvider.fetchMovies();
  }
}
