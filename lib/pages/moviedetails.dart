import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn/definitions/movies.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)!.settings.arguments as MovieModel;
    const String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';
    double height = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(routeData.title),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(imagePathPrefix + routeData.backdrop_path),
              //Image getting all the available space
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top:
                            120), //Making image's width to half of the given screen size
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,

                    //Making image box visually appealing by dropping shadow
                    decoration: BoxDecoration(
                      //Making image box slightly curved
                      borderRadius: BorderRadius.circular(10.0),
                      //Setting box's color to grey
                      color: Colors.grey,

                      //Decorating image
                      image: DecorationImage(
                          image: NetworkImage(
                              imagePathPrefix + routeData.poster_path),
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
                  ), //Empty container when image is not available
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      routeData.title,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  //Styling movie's description text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      routeData.overview,
                      style: const TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black87,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade500),
                ],
              )),
        ),
      ),
    );
  }
}
