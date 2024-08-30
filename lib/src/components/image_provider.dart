import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    super.key,
    required this.imageAddress,
    });

  final String imageAddress;

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(imageAddress),
      );
}
