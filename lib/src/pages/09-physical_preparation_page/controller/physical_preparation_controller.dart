import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../model/physical_preparation_item_model.dart';
import '../repository/physical_preparation_page_repository.dart';

class PhysicalPreparationPageController extends GetxController {
  final PhysicalPreparationPageRepository _repository =
      PhysicalPreparationPageRepository();
  final List<PhysicalPreparationItemModel> installingItemList = [];

  @override
  void onInit() {
    _initPage();
    super.onInit();
  }

  void navigateToStartProcessPage() => Get.toNamed(
        HemoDialysisRouteNames.startProcessPage.uri,
      );

  void _initPage() {
    final List<PhysicalPreparationItemModel> result =
        _repository.getInstallingItems();
    installingItemList.addAll(result);
  }
}
