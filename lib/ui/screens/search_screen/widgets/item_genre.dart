import 'package:flutter/material.dart';

import '../../../../data/models/movie/genre_movie.dart';
import '../../../../theme/my_colors.dart';
import '../movie_by_genre_screen.dart';

class ItemGenre extends StatelessWidget {
  const ItemGenre({
    super.key,
    required this.genre,
  });

  final GenreMovie genre;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.greyDark1,
      borderRadius: const BorderRadius.all(
        Radius.circular(4.0),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieByGenreScreen(
                genreName: genre.name,
                genreId: genre.id,
              ),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Center(
            child: Text(
              genre.name,
              style: const TextStyle(
                color: MyColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
