import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';
import '../search_movie_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchMovieScreen(),
          ),
        );
      },
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MyColors.greyDark1,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: MyColors.white,
            ),
            Expanded(
              child: TextField(
                enabled: false,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: MyColors.white,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: MyColors.white,
                ),
                onChanged: (value) {
                  // setState(() {});
                  // await doSearch(query);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
