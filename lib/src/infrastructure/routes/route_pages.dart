import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/font_page/view/font_page_view.dart';
import 'package:hemo_dialysis/src/pages/vascular_access_page/common/vascular_access_page_binding.dart';
import 'package:hemo_dialysis/src/pages/vascular_access_page/view/vascular_access_page_view.dart';

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
        children: [_volumePage()],
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
      );
}
