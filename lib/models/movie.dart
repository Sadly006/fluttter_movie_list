import 'dart:math';

class Movie {
  final String title;
  final String year;
  final String runtime;
  final String poster;
  double rating;
  int ratingCount;
  bool isLiked;
  String description;

  Movie(
      {required this.title,
      required this.year,
      required this.runtime,
      required this.poster,
      this.rating = 0.0,
      this.ratingCount = 0,
      this.isLiked = false,
      this.description = 'asd'});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'] ?? '',
        year: json['Year'] ?? '',
        runtime: json['Runtime'] ?? '',
        poster: json['Poster'] ??
            'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg',
        rating: json['Rating'] ??
            double.parse((Random().nextDouble() * 5).toStringAsFixed(2)),
        ratingCount: json['RatingCount'] ?? Random().nextInt(5000),
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    );
  }
}
