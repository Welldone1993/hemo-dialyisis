import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../model/installing_item_model.dart';
import '../repository/installing_page_repository.dart';

class InstallingPageController extends GetxController {
  final InstallingPageRepository _repository = InstallingPageRepository();
  final List<InstallingItemModel> installingItemList = [];

  @override
  void onInit() {
    _initPage();
    super.onInit();
  }

  void navigateToPreparationPage() => Get.toNamed(
        HemoDialysisRouteNames.preparationPage.uri,
      );

  void _initPage() {
    final List<InstallingItemModel> result = _repository.getInstallingItems();
    installingItemList.addAll(result);
  }
}
