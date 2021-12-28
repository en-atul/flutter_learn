import 'package:flutter/material.dart';
import 'pages/listmovies.dart';
import 'pages/moviedetails.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const ListMovies(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const MovieDetails(),
      },
    ),
  );
}



