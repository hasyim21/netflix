import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
