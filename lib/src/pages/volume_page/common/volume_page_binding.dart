import 'package:get/get.dart';

import '../controller/volume_page_controller.dart';



class VolumePageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(VolumePageController.new);
}
