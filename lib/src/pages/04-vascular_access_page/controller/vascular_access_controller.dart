import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class VascularAccessController extends GetxController {
  void navigateToConsumablesPage() =>
      Get.toNamed(HemoDialysisRouteNames.consumablesPage.uri);

}
