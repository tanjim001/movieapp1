import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/movie/moviedetails.dart';

class MovieListItem extends StatelessWidget {
  final PMovie moviemodal;
  const MovieListItem({Key? key, required this.moviemodal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(moviemodal: moviemodal),
          ),
        );
      },
      child: SizedBox(
        width: 160,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 140,
                height: 160,
                fit: BoxFit.cover,
                imageUrl: pimagedburl + moviemodal.posterPath.toString(),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              moviemodal.title.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color.fromARGB(255, 233, 231, 231),
                  fontWeight: FontWeight.w300),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(
                  child: Text(
                    moviemodal.voteAverage.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
