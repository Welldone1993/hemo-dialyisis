import 'package:get/get.dart';

class EducationPageController extends GetxController {
  RxBool canShowData = false.obs;

  @override
  void onInit() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () => canShowData.value = true,
    );
    super.onInit();
  }
}
