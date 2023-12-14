import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/my_colors.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key, required this.isCarousel});

  final bool isCarousel;

  @override
  Widget build(BuildContext context) {
    return (isCarousel) ? _itemCarouselShimmer(context) : _itemMovieShimmer();
  }

  Shimmer _itemCarouselShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.66,
          viewportFraction: 1,
        ),
        items: [1, 2, 3, 4, 5].map((movie) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: MyColors.greyDark1,
          );
        }).toList(),
      ),
    );
  }

  SizedBox _itemMovieShimmer() {
    return SizedBox(
      height: 179.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              height: 15.0,
              width: 106.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
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
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 8.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
