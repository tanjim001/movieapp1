import 'dart:convert';

import 'package:http/http.dart' as http; // Import http as http
import 'package:movie_app/Model/PCast.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/Model/PVideo.dart';
import 'package:movie_app/constant/constant.dart';

enum MovieType { credits, popular, now_playing, top_rated, upcoming, similar }

class Apiservice {
  Future<List<PMovie>> getmoviedata(MovieType type, {int movieid = 0}) async {
    String url = "";
    if (type == MovieType.popular) {
      url = moviedburl + ppopular;
    } else if (type == MovieType.now_playing) {
      url = moviedburl + pnow_playing;
    } else if (type == MovieType.top_rated) {
      url = moviedburl + ptop_rated;
    } else if (type == MovieType.upcoming) {
      url = moviedburl + pupcoming;
    } else if (type == MovieType.similar) {
      url = moviedburl + movieid.toString() + psimilar;
    } else if (type == MovieType.credits) {
      url = moviedburl + movieid.toString() + pcredits;
    }
    try {
      http.Response response = await http.get(Uri.parse(
          "$url?api_key=b626c247964990566e98170ded959e44&language=en-us")); // Use http.get instead of get

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body =
            json['results']; // Use 'results' instead of 'result'

        // Assuming PMovie.fromJson is a constructor in your PMovie class to create an instance from JSON
        List<PMovie> movielist =
            body.map((dynamic item) => PMovie.fromJson(item)).toList();
        return movielist;
      } else {
        throw Exception('no movie found');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<PVideo>> getvideos(int id) async {
    String url = "";
    url = moviedburl + id.toString() + pvideo;
    try {
      http.Response response = await http.get(Uri.parse(
          "$url?api_key=b626c247964990566e98170ded959e44&language=en-us")); // Use http.get instead of get

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body =
            json['results']; // Use 'results' instead of 'result'

        // Assuming PMovie.fromJson is a constructor in your PMovie class to create an instance from JSON
        List<PVideo> videolist =
            body.map((dynamic item) => PVideo.fromJson(item)).toList();
        return videolist;
      } else {
        throw Exception('no movie found');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<PCast>> getcastlist(int id) async {
    String url = "";
    url = moviedburl + id.toString() + pcredits;
    try {
      http.Response response = await http.get(Uri.parse(
          "$url?api_key=b626c247964990566e98170ded959e44&language=en-us")); // Use http.get instead of get

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['cast'];

        List<PCast> castlist =
            body.map((dynamic item) => PCast.fromJson(item)).toList();
        return castlist;
      } else {
        throw Exception('no movie found');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
