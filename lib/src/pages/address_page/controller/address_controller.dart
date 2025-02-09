import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class AddressController {
  void navigateToFontPage() => Get.toNamed(HemoDialysisRouteNames.fontPage.uri);

  void navigateToHomePage() =>
      Get.offAllNamed(HemoDialysisRouteNames.homePage.uri);
}
