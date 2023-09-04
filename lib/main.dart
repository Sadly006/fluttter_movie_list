import 'package:flutter/material.dart';
import 'package:flutter_movie_list/homepage.dart';
import 'package:flutter_movie_list/login.dart';
import 'package:flutter_movie_list/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: MaterialApp(
        routes: {
          '/home': (context) => HomeScreen(),
        },
        title: 'Movie List',
        home: LoginScreen(),
      ),
    );
  }
}
