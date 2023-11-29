import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/Model/PVideo.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/movie/castpage.dart';
import 'package:movie_app/movie/movie_cat.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatelessWidget {
  Apiservice apiservice = Apiservice();
  final PMovie moviemodal;
  MovieDetail({super.key, required this.moviemodal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          moviemodal.title.toString(),
          style:
              const TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: pimagedburl + moviemodal.backdropPath.toString(),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                FutureBuilder(
                  future: apiservice.getvideos(moviemodal.id?.toInt() ?? 0),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<PVideo> videolist = snapshot.data ?? [];
                      if (videolist.isNotEmpty) {
                        return CircleAvatar(
                          child: IconButton(
                            icon: const Icon(Icons.play_circle),
                            onPressed: () async {
                              if (!await launchUrl(
                                Uri.parse(
                                    'http://www.youtube.com/embed/${videolist[0].key}'),
                              )) {
                                throw Exception("could not launch");
                              }
                              ;
                            },
                          ),
                        );
                      }
                    }
                    return const SizedBox();
                  },
                )
              ]),
              Row(
                children: [
                  Text(
                    moviemodal.title.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: moviemodal.voteAverage?.toDouble() ?? 0.0,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                    itemCount: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    moviemodal.voteAverage.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 170,
                  ),
                  Text(
                    "Reviwed: ${moviemodal.voteCount}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text("Overview",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              Container(
                child: Text(
                  moviemodal.overview.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cast",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: CastPage(id: moviemodal.id?.toInt() ?? 0),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Similar",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: MovieCat(
                  type: MovieType.similar,
                  movieid: moviemodal.id?.toInt() ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
