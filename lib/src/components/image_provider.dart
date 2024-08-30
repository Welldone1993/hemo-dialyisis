import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    super.key,
    required this.imageAddress,
  });

  final String imageAddress;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Constants.height(context, fraction: 5),
        width: Constants.width(context, fraction: 10),
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
