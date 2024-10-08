import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class HomePageController extends GetxController {
  void navigateToVolumePage() =>
      Get.toNamed(HemoDialysisRouteNames.volumePage.uri);

  void navigateToProfilePage() =>
      Get.toNamed(HemoDialysisRouteNames.profilePage.uri);

  void navigateToEducationPage() =>
      Get.toNamed(HemoDialysisRouteNames.educationPage.uri);

  void navigateToStorePage() =>
      Get.toNamed(HemoDialysisRouteNames.storePage.uri);
}
