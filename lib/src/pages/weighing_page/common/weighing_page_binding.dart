import 'package:get/get.dart';

import '../controller/weighing_page_controller.dart';



class WeighingPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(WeighingPageController.new);
}
