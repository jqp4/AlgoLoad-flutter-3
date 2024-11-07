import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap.x(
    double size, {
    super.key,
  })  : width = size,
        height = 0;

  const Gap.y(
    double size, {
    super.key,
  })  : width = 0,
        height = size;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
