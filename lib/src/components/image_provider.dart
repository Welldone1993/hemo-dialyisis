import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    super.key,
    required this.imageAddress,
  });

  final String imageAddress;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 10,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAddress),
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
}
