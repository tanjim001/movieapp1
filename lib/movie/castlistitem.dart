import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/PCast.dart';
import 'package:movie_app/constant/constant.dart';

class CastItem extends StatelessWidget {
  final PCast castmodel;
  const CastItem({Key? key, required this.castmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: pimagedburl + castmodel.profilePath.toString(),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(
            castmodel.name.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            castmodel.knownForDepartment.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
