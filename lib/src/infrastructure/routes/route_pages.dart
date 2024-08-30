import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/consumables_page/view/consumable_page_view.dart';
import 'package:hemo_dialysis/src/pages/font_page/view/font_page_view.dart';
import 'package:hemo_dialysis/src/pages/profile_page/common/profile_page_binding.dart';
import 'package:hemo_dialysis/src/pages/profile_page/view/profile_page_view.dart';
import 'package:hemo_dialysis/src/pages/vascular_access_page/common/vascular_access_page_binding.dart';
import 'package:hemo_dialysis/src/pages/vascular_access_page/view/vascular_access_page_view.dart';

import '../../pages/consumables_page/common/consumables_page_binding.dart';
import '../../pages/font_page/common/font_page_binding.dart';
import '../../pages/home/common/home_page_binding.dart';
import '../../pages/home/view/home_page_view.dart';
import '../../pages/volume_page/common/volume_page_binding.dart';
import '../../pages/volume_page/view/volume_page_view.dart';
import 'route_names.dart';

class HemoDialysisModulePages {
  static final List<GetPage<dynamic>> routes = [
    _homePage(),
  ];

  static GetPage<dynamic> _homePage() => GetPage(
        name: HemoDialysisRouteNames.homePage.path,
        page: HomePageView.new,
        binding: HomePageBinding(),
        children: [
          _volumePage(),
          _profilePage(),
        ],
      );

  static GetPage<dynamic> _profilePage() => GetPage(
        name: HemoDialysisRouteNames.profilePage.path,
        page: ProfilePageView.new,
        binding: ProfilePageBinding(),
        customTransition: MyCustomTransition(),
        transitionDuration: const Duration(milliseconds: 200),
      );

  static GetPage<dynamic> _volumePage() => GetPage(
        name: HemoDialysisRouteNames.volumePage.path,
        page: VolumePageView.new,
        binding: VolumePageBinding(),
        children: [_fontPage()],
      );

  static GetPage<dynamic> _fontPage() => GetPage(
        name: HemoDialysisRouteNames.fontPage.path,
        page: FontPageView.new,
        binding: FontPageBinding(),
        children: [_vascularAccessPage()],
      );

  static GetPage<dynamic> _vascularAccessPage() => GetPage(
        name: HemoDialysisRouteNames.vascularAccessPage.path,
        page: VascularAccessPageView.new,
        binding: VascularAccessPageBinding(),
        children: [_consumablesPage()],
      );

  static GetPage<dynamic> _consumablesPage() => GetPage(
        name: HemoDialysisRouteNames.consumablesPage.path,
        page: ConsumablesPageView.new,
        binding: ConsumablesPageBinding(),
      );
}

class MyCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;

    var tween = Tween(
      begin: begin,
      end: end,
    );
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
