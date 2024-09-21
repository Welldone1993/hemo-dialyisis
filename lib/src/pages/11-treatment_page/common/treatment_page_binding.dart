import 'package:get/get.dart';

import '../controller/treatment_controller.dart';



class TreatmentPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(TreatmentPageController.new);
}
