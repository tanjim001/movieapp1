import 'package:flutter/material.dart';

import 'package:movie_app/movie/movie_page.dart';
import 'package:movie_app/tv/tv_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  Widget getview() {
    if (_selectedIndex == 0)
      return MovieHome();
    else
      return TVPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            "Movie APP",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FlutterLogo(
                  size: 40,
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: getview(),
      ),
    );
  }
}
