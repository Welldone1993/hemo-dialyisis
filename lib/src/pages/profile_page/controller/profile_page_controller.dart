import 'package:get/get.dart';

import '../model/enum/profile_header_button_enum.dart';

class ProfilePageController extends GetxController {

  late int headerId;
  RxBool canShowData = false.obs;



  Rx<ProfileHeaderButtonEnum> selectedHeader = ProfileHeaderButtonEnum.info.obs;
  DateTime today = DateTime.now();

  @override
  void onInit() {
  headerId =  Get.arguments;
  if(headerId ==2){
    selectedHeader.value = ProfileHeaderButtonEnum.prescription;
  }
    Future.delayed(
      const Duration(milliseconds: 200),
      () => canShowData.value = true,
    );
    super.onInit();
  }
}
