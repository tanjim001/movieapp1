import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart';
import 'package:movie_app/movie/moviedetails.dart';

class SearchResultPage extends StatelessWidget {
  final List<PMovie> searchResults;

  const SearchResultPage({Key? key, required this.searchResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(206, 2, 2, 2),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          PMovie movie = searchResults[index];

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 12, 12, 15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(moviemodal: movie),
                  ),
                );
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  width: 50,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.title.toString(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                movie.overview.toString(),
                maxLines: 2,
                style: const TextStyle(
                    color: Color.fromARGB(101, 255, 255, 255),
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              // Add more details or customize the UI as needed
            ),
          );
        },
      ),
    );
  }
}
