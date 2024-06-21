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
