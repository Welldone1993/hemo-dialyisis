import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    super.key,
    required this.imageAddress,
    });

  final String imageAddress;

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
        // fit: BoxFit.contain,
        child: Image.asset(imageAddress),
      );
}
