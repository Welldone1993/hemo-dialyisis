import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/routes/route_names.dart';

class StartProcessPageController extends GetxController {
  void navigateToTreatmentPage() =>
      Get.toNamed(HemoDialysisRouteNames.treatmentPage.uri);
}
