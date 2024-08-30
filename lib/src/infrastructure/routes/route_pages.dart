import 'package:get/get.dart';

import '../../pages/home/common/home_page_binding.dart';
import '../../pages/home/view/home_page_view.dart';
import '../../pages/volume_page/common/volume_page_binding.dart';
import '../../pages/volume_page/view/volum_page_view.dart';
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
        ],
      );

  static GetPage<dynamic> _volumePage() => GetPage(
        name: HemoDialysisRouteNames.volumePage.path,
        page: VolumePageView.new,
        binding: VolumePageBinding(),
      );
}
