import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/routes/route_names.dart';

class WeighingPageController extends GetxController {
  void navigateToInstallingPage() => Get.toNamed(
        HemoDialysisRouteNames.installingPage.uri,
      );
}
