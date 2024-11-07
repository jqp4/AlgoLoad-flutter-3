import 'package:flutter/material.dart';

class SliverGap extends StatelessWidget {
  const SliverGap.x(
    double size, {
    super.key,
  })  : width = size,
        height = 0;

  const SliverGap.y(
    double size, {
    super.key,
  })  : width = 0,
        height = size;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
