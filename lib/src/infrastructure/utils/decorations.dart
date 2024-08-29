import 'package:flutter/material.dart';

import 'constants.dart';

class Decorations {
  factory Decorations() => _instance;

  Decorations._();

  static final Decorations _instance = Decorations._();

  static cardDecoration() => BoxDecoration(
        color: Constants.cardBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.xxLargeSpace),
        ),
        border: Border.all(
          color: Constants.cardBorderColor,
          width: 2,
        ),
      );
}
