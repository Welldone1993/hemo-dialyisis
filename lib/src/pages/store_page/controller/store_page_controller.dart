import 'package:get/get.dart';

import '../model/store_item_view_model.dart';
import '../repository/store_page_repository.dart';

class StorePageController extends GetxController {
  final StorePageRepository _repository = StorePageRepository();
  final List<StoreItemViewModel> storeItems = [];

  @override
  void onInit() {
    _initPage();
    super.onInit();
  }

  void _initPage() {
    final List<StoreItemViewModel> result = _repository.getStoreItems();
    storeItems.addAll(result);
  }
}
