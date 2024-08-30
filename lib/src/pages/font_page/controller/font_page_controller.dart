import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class FontPageController extends GetxController {
  void navigateToVascularAccessPage() =>
      Get.toNamed(HemoDialysisRouteNames.vascularAccessPage.uri);
}
