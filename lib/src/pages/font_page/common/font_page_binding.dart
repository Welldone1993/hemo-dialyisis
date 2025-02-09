import 'package:get/get.dart';

import '../controller/font_page_controller.dart';



class FontPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(FontPageController.new);
}
