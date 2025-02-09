import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class HomePageController extends GetxController {
  void navigateToFontPage() =>
      Get.toNamed(HemoDialysisRouteNames.fontPage.uri);

  void navigateToProfilePage() =>
      Get.toNamed(HemoDialysisRouteNames.profilePage.uri);

  void navigateToEducationPage() =>
      Get.toNamed(HemoDialysisRouteNames.educationPage.uri);

  void navigateToStorePage() =>
      Get.toNamed(HemoDialysisRouteNames.storePage.uri);
}
