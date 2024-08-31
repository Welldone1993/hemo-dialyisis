import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    super.key,
    required this.imageAddress,
    this.aspectRatio,
  });

  final String imageAddress;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: aspectRatio ?? 1,
        child: Image.asset(imageAddress),
      );
}
