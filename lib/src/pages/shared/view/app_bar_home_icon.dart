import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class AppBarHomeIcon extends StatelessWidget {
  const AppBarHomeIcon({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => Get.offAllNamed(HemoDialysisRouteNames.homePage.uri),
        icon: const Icon(FontAwesomeIcons.house),
      );
}
