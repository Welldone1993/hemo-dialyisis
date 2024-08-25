
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/infrastructure/routes/route_pages.dart';

class HemoDialysis extends StatelessWidget {
  const HemoDialysis({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    getPages: [
      ...HemoDialysisModulePages.routes,
    ],
    initialRoute: '/home-Page',
    debugShowCheckedModeBanner: false,
  );
}
