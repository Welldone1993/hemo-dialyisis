import 'dart:async';

import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class BloodReturnController extends GetxController {
  void buttonAction() {
    Get.offAllNamed(HemoDialysisRouteNames.endTreatmentPage.uri);
  }
}
