import 'package:flutter/material.dart';
import 'package:learn/definitions/movies.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData=ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:  Text(routeData.title),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}