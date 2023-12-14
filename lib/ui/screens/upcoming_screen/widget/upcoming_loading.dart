import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UpcomingLoading extends StatelessWidget {
  const UpcomingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 168.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
