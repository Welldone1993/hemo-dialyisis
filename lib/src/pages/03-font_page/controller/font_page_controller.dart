import 'package:get/get.dart';

import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/routes/route_names.dart';

class FontPageController extends GetxController {
  void navigateToVascularAccessPage() =>
      Get.toNamed(HemoDialysisRouteNames.vascularAccessPage.uri);

  void increaseFont() =>
      AppController().setting.value = AppController().setting.value!.copyWith(
            titleFontSize: AppController().setting.value!.titleFontSize + 1,
            valueFontSize: AppController().setting.value!.valueFontSize + 1,
          );

  void decreaseFont() {
    if (AppController().setting.value!.valueFontSize == 1 ||
        AppController().setting.value!.titleFontSize == 1) {
      return;
    }
    AppController().setting.value = AppController().setting.value!.copyWith(
          titleFontSize: AppController().setting.value!.titleFontSize - 1,
          valueFontSize: AppController().setting.value!.valueFontSize - 1,
        );
  }
}
