import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class VascularAccessController extends GetxController {
  void navigateToWeighingPage() =>
      Get.toNamed(HemoDialysisRouteNames.weighingPage.uri);

}
