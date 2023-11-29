import 'package:flutter/material.dart';
import 'package:movie_app/Model/PMovie.dart'; // Import your PMovie model
import 'package:movie_app/movie/searchresult.dart';
import 'package:movie_app/service/apiservice.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  Apiservice apiservice = Apiservice();
  final TextEditingController _searchController = TextEditingController();

  // Function to handle the search action
  void _performSearch() async {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      try {
        List<PMovie> searchResults = await apiservice.searchdata(query);

        // Navigate to another page to display search results
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SearchResultPage(searchResults: searchResults),
          ),
        );
      } catch (e) {
        print('Error searching: $e');
        // Handle the error, e.g., show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF292B37),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.white54,
              size: 30,
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(left: 5),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                onSubmitted: (value) {
                  _performSearch();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
