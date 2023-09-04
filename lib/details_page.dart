import 'package:flutter/material.dart';
import 'package:flutter_movie_list/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  DetailsPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    Color ratingColor = Colors.red;
    if (movieProvider.movies[index].rating >= 4.0) {
      ratingColor = Colors.green;
    } else if (movieProvider.movies[index].rating >= 2.0) {
      ratingColor = Colors.yellow;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 34, 67),
      appBar: AppBar(
        title: Text(movieProvider.movies[index].title),
        backgroundColor: const Color.fromARGB(255, 36, 34, 67),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieProvider.movies[index].poster),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movieProvider.movies[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle play button press
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(
                                  255, 125, 118, 221), // Background color
                            ),
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Play'),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              movieProvider.movies[index].isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: movieProvider.movies[index].isLiked ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              if (movieProvider.movies[index].isLiked) {
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Rating: ${movieProvider.movies[index].rating}',
                          style: TextStyle(
                              color: ratingColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movieProvider.movies[index].description,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: 'Genre: ',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            TextSpan(
                                text: 'Action, Thriller',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: 'Cast: ',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            TextSpan(
                                text:
                                    'Morgan Freeman, Tim Robbins, Clancy Brown',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to generate random text (replace with your logic)
  String generateRandomText() {
    // Replace this with logic to generate random text
    return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
  }
}
