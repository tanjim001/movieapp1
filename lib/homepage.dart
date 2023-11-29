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
            "Movie\nApp",
          ),
          leading: const FlutterLogo(size: 10),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          actions: const [Icon(Icons.menu)],
          toolbarHeight: 40,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        body: getview(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV"),
            ]),
      ),
    );
  }
}
