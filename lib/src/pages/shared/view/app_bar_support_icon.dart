import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarSupportIcon extends StatelessWidget {
  const AppBarSupportIcon({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          print('support');
        },
        icon: const Icon(FontAwesomeIcons.headset),
      );
}
