import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/movie/movielistitem.dart';
import 'package:movie_app/service/apiservice.dart';

class MovieCat extends StatefulWidget {
  final MovieType type;
  final int movieid;
  const MovieCat({Key? key, required this.type, this.movieid = 0})
      : super(key: key);

  @override
  State<MovieCat> createState() => _MovieCatState();
}

class _MovieCatState extends State<MovieCat> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PMovie> moviedata = snapshot.data ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return MovieListItem(moviemodal: moviedata[index]);
            },
            itemCount: moviedata.length,
            scrollDirection: Axis.horizontal,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: apiservice.getmoviedata(widget.type, movieid: widget.movieid),
    );
  }
}
