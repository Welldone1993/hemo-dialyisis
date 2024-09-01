import 'package:get/get.dart';

import '../controller/preparation_page_controller.dart';

class PreparationPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(PreparationPageController.new);
}
