import 'package:get/get.dart';

import '../controller/education_page_controller.dart';



class EducationPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(EducationPageController.new);
}
