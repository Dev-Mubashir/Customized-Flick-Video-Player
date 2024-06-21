import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<dynamic> movies;

  const MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horror Row
        buildGenreRow(
          context,
          'Horror',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Horror')
              .toList(),
        ),
        // Action Row
        buildGenreRow(
          context,
          'Action',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Action')
              .toList(),
        ),
        // Comedy Row
        buildGenreRow(
          context,
          'Comedy',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Comedy')
              .toList(),
        ),
        // Drama Row
        buildGenreRow(
          context,
          'Drama',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Drama')
              .toList(),
        ),
        // Crime Row
        buildGenreRow(
          context,
          'Crime',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Crime')
              .toList(),
        ),
        // Mystery Row
        buildGenreRow(
          context,
          'Mystery',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Mystery')
              .toList(),
        ),
        // Adventure Row
        buildGenreRow(
          context,
          'Adventure',
          movies
              .where((movie) =>
                  movie['genres'] != null &&
                  movie['genres'].isNotEmpty &&
                  movie['genres'].first == 'Adventure')
              .toList(),
        ),
      ],
    );
  }
}

Widget buildGenreRow(
  BuildContext context,
  String genre,
  List<dynamic> movies,
) {
  return Row(
    children: [
      Text(genre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(width: 16),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length > 10 ? 10 : movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(movies[index].thumbnail),
              ),
            );
          },
        ),
      ),
      SizedBox(width: 16),
      TextButton(
        onPressed: () {
          // navigate to full list of movies for this genre
        },
        child: Text('See All'),
      ),
    ],
  );
}
