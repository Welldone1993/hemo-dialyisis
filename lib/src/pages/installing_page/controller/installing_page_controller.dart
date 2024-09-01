import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/installing_page/model/installing_item_model.dart';

import '../installing_page_repository.dart';

class InstallingPageController extends GetxController {
  final InstallingPageRepository _repository = InstallingPageRepository();
  final List<InstallingItemModel> installingItemList = [];

  @override
  void onInit() {
    _initPage();
    super.onInit();
  }

  void _initPage() {
    final List<InstallingItemModel> result = _repository.getInstallingItems();
    installingItemList.addAll(result);
  }
}
