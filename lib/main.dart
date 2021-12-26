//https://api.nasa.gov/planetary/apod?api_key=WYADYvqRqLHWEEJbooogmsCg82AnA3UOEoqeXQ3K
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MoviesApp());

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesListing(),
    );
  }
}

class MoviesProvider {
  static const String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  //REPLACE: Replace YOUR_API_KEY with your API key
  static const apiKey = "25c50fb149b3910e17ace24569beca98";

  static Future<Map> getJson() async {
    const apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&sort_by=popularity.desc";
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    return json.decode(apiResponse.body);
  }
}

class MoviesListing extends StatefulWidget {
  const MoviesListing({Key? key}) : super(key: key);

  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  List<MovieModel> movies = [];

  fetchMovies() async {
    var data = await MoviesProvider.getJson();

    setState(() {
      List<dynamic> results = data['results'];
      for (var element in results) {
        movies.add(MovieModel.fromJson(element));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    //This method is called once when the widet starts first time
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    //Note- Call fetchMovies once from initState()
    //fetchMovies();

    return Scaffold(
      body: ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),

            //NEW CODE: New way to display title
            //Title is being accessed as below rather `movies[index]["title"]`
            child: MovieTile(movies, index),
          );
        },
      ),
    );
  }
}

//NEW CODE: MovieTile object to render visually appealing movie information
class MovieTile extends StatelessWidget {
  final List<MovieModel> movies;
  // ignore: prefer_typing_uninitialized_variables
  final index;

  // ignore: use_key_in_widget_constructors
  const MovieTile(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          //Resizing image poster based on the screen size whenever image's path is not null.
//Resizing image poster based on the screen size whenever the image's path is not null.
          // ignore: unnecessary_null_comparison
          movies[index].poster_path != null
              ? Container(
                  //Making image's width to half of the given screen size
                  width: MediaQuery.of(context).size.width / 2,

                  //Making image's height to one fourth of the given screen size
                  height: MediaQuery.of(context).size.height / 4,

                  //Making image box visually appealing by dropping shadow
                  decoration: BoxDecoration(
                    //Making image box slightly curved
                    borderRadius: BorderRadius.circular(10.0),
                    //Setting box's color to grey
                    color: Colors.grey,

                    //Decorating image
                    image: DecorationImage(
                        image: NetworkImage(MoviesProvider.imagePathPrefix +
                            movies[index].poster_path),
                        //Image getting all the available space
                        fit: BoxFit.cover),

                    //Dropping shadow
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          //grey colored shadow
                          color: Colors.grey,
                          //Applying softening effect
                          blurRadius: 3.0,
                          //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                          offset: Offset(1.0, 3.0)),
                    ],
                  ),
                )
              : Container(), //Empty container when image is not available
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movies[index].title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          //Styling movie's description text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movies[index].overview,
            ),
          ),
          Divider(color: Colors.grey.shade500),
        ],
      ),
    );
  }
}
//JSON response is converted into MovieModel object

class MovieModel {
  final int id;
  final num popularity;
  // ignore: non_constant_identifier_names
  final int vote_count;
  final bool video;
  // ignore: non_constant_identifier_names
  final String poster_path;
  // ignore: non_constant_identifier_names
  final String backdrop_path;
  final bool adult;
  // ignore: non_constant_identifier_names
  final String original_language;
  // ignore: non_constant_identifier_names
  final String original_title;
  // ignore: non_constant_identifier_names
  final List<dynamic> genre_ids;
  final String title;
  // ignore: non_constant_identifier_names
  final num vote_average;
  final String overview;
  // ignore: non_constant_identifier_names
  final String release_date;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'],
        vote_count = json['vote_count'],
        video = json['video'],
        poster_path = json['poster_path'],
        adult = json['adult'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        genre_ids = json['genre_ids'],
        title = json['title'],
        vote_average = json['vote_average'],
        overview = json['overview'],
        release_date = json['release_date'],
        backdrop_path = json['backdrop_path'];
}
