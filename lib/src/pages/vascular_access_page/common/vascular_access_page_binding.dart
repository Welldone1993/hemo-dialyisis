import 'package:get/get.dart';

import '../controller/vascular_access_controller.dart';

class VascularAccessPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(VascularAccessController.new);
}
