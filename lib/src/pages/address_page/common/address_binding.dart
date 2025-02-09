import 'package:get/get.dart';

import '../controller/address_controller.dart';

class AddressPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AddressController.new);
}
