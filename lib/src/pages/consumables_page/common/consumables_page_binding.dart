import 'package:get/get.dart';

import '../controller/consumable_page_controller.dart';

class ConsumablesPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(ConsumablesPageController.new);
}
