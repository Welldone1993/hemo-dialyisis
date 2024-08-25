import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

class HomePageBinging extends Bindings {
  @override
  void dependencies() => Get.lazyPut(HomePageController.new);
}
