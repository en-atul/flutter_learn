import 'package:flutter/material.dart';
import '../definitions/movies.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({Key? key}) : super(key: key);

  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<ListMovies> {
  List<MovieModel> movieslist = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      List<dynamic> results = movies;
      for (var element in results) {
        movieslist.add(MovieModel.fromJson(element));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Animated Movies',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.8),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(movieslist.length, (index) {
          return Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: MovieTile(movieslist, index));
        }),
      ),
    );
  }
}

//NEW CODE: MovieTile object to render visually appealing movie information
class MovieTile extends StatelessWidget {
  final List<MovieModel> movies;
  // ignore: prefer_typing_uninitialized_variables
  final index;
  final String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  // ignore: use_key_in_widget_constructors
  const MovieTile(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // ignore: avoid_print
        onTap: () {
          Navigator.pushNamed(context, "/second", arguments: movies[index]);
        },
        child: Padding(
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
                      height: 300,

                      //Making image box visually appealing by dropping shadow
                      decoration: BoxDecoration(
                        //Making image box slightly curved
                        borderRadius: BorderRadius.circular(10.0),
                        //Setting box's color to grey
                        color: Colors.grey,

                        //Decorating image
                        image: DecorationImage(
                            image: NetworkImage(
                                imagePathPrefix + movies[index].poster_path),
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
                child: Text(movies[index].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ));
  }
}
