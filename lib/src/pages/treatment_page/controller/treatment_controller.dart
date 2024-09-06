import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/routes/route_names.dart';

class TreatmentPageController extends GetxController {
  void navigateToBloodReturnPage() =>
      Get.toNamed(HemoDialysisRouteNames.bloodReturnPage.uri);
}
