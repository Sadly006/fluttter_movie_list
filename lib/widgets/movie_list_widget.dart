import 'package:flutter/material.dart';
import 'package:flutter_movie_list/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'movie_tile_widget.dart';

class MovieListWidget extends StatelessWidget {
  // final List<Movie> movies;

  MovieListWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        final movies = movieProvider.movies;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MovieTile(movie: movies[index], index: index),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  // Add a white divider aligned to the right (75% of the screen)
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 0.5,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
              ],
            );
          },
        );
      },
    );
  }
}
