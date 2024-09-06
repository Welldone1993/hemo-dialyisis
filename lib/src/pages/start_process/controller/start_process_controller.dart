import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class StartProcessPageController extends GetxController {
  void navigateToTreatmentPage() =>
      Get.toNamed(HemoDialysisRouteNames.treatmentPage.uri);
}
