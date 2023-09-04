import 'package:flutter/material.dart';
import 'package:flutter_movie_list/details_page.dart';
import 'package:flutter_movie_list/models/movie.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final int index;

  MovieTile({required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color.fromARGB(255, 36, 34, 67),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(movie.poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 15)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              index: index,
                            )),
                  );
                },
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              Text(
                'Year: ${movie.year}',
                style: const TextStyle(color: Colors.white),
              ),
              // const Padding(padding: EdgeInsets.all(2)),
              Row(
                children: <Widget>[
                  Text(
                    'Rating: ${movie.rating}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  IconButton(
                    icon: Icon(
                      movie.isLiked ? Icons.star : Icons.star_border,
                      color: movie.isLiked ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      if (movie.isLiked) {
                        movieProvider.dislikeMovie(index);
                      } else {
                        movieProvider.likeMovie(index);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
