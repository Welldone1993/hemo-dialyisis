import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class WeighingPageController extends GetxController {
  void navigateToInstallingPage() => Get.toNamed(
        HemoDialysisRouteNames.installingPage.uri,
      );
}
