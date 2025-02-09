import 'package:get/get.dart';

import '../controller/blood_return_controller.dart';

class BloodReturnPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(BloodReturnController.new);
}
