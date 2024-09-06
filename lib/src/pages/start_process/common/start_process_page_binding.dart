import 'package:get/get.dart';

import '../controller/start_process_controller.dart';



class StartProcessPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(StartProcessPageController.new);
}
