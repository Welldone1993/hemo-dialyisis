import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/app_controller/app_controller.dart';

import 'src/infrastructure/routes/route_pages.dart';

class HemoDialysis extends StatelessWidget {
  const HemoDialysis({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        onInit: AppController().initializeApp,
        getPages: [
          ...HemoDialysisModulePages.routes,
        ],
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
      );
}
