import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieByGenreLoading extends StatelessWidget {
  const MovieByGenreLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.697,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 152,
            width: 106,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
