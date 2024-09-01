import 'package:get/get.dart';

import '../controller/installing_page_controller.dart';

class InstallingPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(InstallingPageController.new);
}
