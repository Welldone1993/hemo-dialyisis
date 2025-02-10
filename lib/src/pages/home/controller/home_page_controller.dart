import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class HomePageController extends GetxController {
  void navigateToAddressPage() =>
      Get.toNamed(HemoDialysisRouteNames.addressPage.uri);

  void navigateToProfilePage() =>
      Get.toNamed(HemoDialysisRouteNames.profilePage.uri,
          arguments: 1);

  void navigateToPrescriptionPage() =>
      Get.toNamed(HemoDialysisRouteNames.profilePage.uri,
          arguments:  2);

  void navigateToEducationPage() =>
      Get.toNamed(HemoDialysisRouteNames.educationPage.uri);

  void navigateToStorePage() =>
      Get.toNamed(HemoDialysisRouteNames.storePage.uri);
}
