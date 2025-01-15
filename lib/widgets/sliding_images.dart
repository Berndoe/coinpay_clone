import 'package:flutter/material.dart';

class SlidingImages extends StatelessWidget {
  final String image;

  const SlidingImages(this.image, {super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}
