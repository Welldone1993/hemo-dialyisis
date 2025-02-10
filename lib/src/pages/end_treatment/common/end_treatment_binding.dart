import 'package:get/get.dart';

import '../controller/end_treatment_controller.dart';


class EndTreatmentPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(EndTreatmentController.new);
}
