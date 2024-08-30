import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class HomePageController extends GetxController {
  void navigateToVolumePage() =>
      Get.toNamed(HemoDialysisRouteNames.volumePage.uri);
}
