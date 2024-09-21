import 'package:get/get.dart';

import '../controller/physical_preparation_controller.dart';



class PhysicalPreparationPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(PhysicalPreparationPageController.new);
}
