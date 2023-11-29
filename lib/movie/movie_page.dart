import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart';

import 'package:movie_app/movie/movie_cat.dart';

import 'package:movie_app/movie/moviecarousel.dart';
import 'package:movie_app/service/apiservice.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            builder: (context, snapsot) {
              if (snapsot.hasData) {
                List<PMovie> moviedata = snapsot.data ?? [];
                return MovieCarosel(movielist: moviedata);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            future: apiservice.getmoviedata(MovieType.popular),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
            child: MovieCat(type: MovieType.popular),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Rated",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
            child: MovieCat(type: MovieType.top_rated),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UpComing",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
            child: MovieCat(type: MovieType.upcoming),
          ),
        ],
      ),
    );
  }
}
