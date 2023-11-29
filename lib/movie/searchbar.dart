import 'package:flutter/material.dart';
import 'package:movie_app/service/apiservice.dart';

class SearchMovie extends StatefulWidget {
  final String query;
  const SearchMovie({super.key, required this.query});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SearchBar(
        textStyle: MaterialStateProperty.all(
            TextStyle(color: Color.fromARGB(188, 255, 255, 255))),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(15, 0, 0, 0)),
        leading:
            const Icon(Icons.search, color: Color.fromARGB(132, 187, 177, 177)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
