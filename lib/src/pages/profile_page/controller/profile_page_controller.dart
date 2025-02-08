import 'package:get/get.dart';

import '../model/enum/profile_header_button_enum.dart';

class ProfilePageController extends GetxController {
  RxBool canShowData = false.obs;

  Rx<ProfileHeaderButtonEnum> selectedHeader = ProfileHeaderButtonEnum.info.obs;
  DateTime today = DateTime.now();
  @override
  void onInit() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () => canShowData.value = true,
    );
    super.onInit();
  }
}
