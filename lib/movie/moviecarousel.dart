import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/constant/constant.dart';

class MovieCarosel extends StatefulWidget {
  final List<PMovie> movielist;
  const MovieCarosel({super.key, required this.movielist});

  @override
  State<MovieCarosel> createState() => _MovieCaroselState();
}

class _MovieCaroselState extends State<MovieCarosel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: CarouselSlider.builder(
        itemCount: widget.movielist.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: pimagedburl +
                widget.movielist[itemIndex].backdropPath.toString(),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
        options:
            CarouselOptions(height: 180, autoPlay: true, aspectRatio: 16 / 9),
      ),
    );
  }
}
