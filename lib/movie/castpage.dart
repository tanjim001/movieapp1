import 'package:flutter/material.dart';
import 'package:movie_app/Model/PCast.dart';
import 'package:movie_app/movie/castlistitem.dart';
import 'package:movie_app/service/apiservice.dart';

class CastPage extends StatefulWidget {
  final int id;
  const CastPage({super.key, required this.id});

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiservice.getcastlist(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PCast> castlist = snapshot.data ?? [];
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: castlist.length,
                itemBuilder: (context, index) {
                  return CastItem(castmodel: castlist[index]);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
