import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/store_page_controller.dart';
import '../../model/store_item_view_model.dart';

class StoreItem extends GetView<StorePageController> {
  const StoreItem({
    required this.storeItem,
    super.key,
  });

  final StoreItemViewModel storeItem;

  @override
  Widget build(BuildContext context) => Text(storeItem.title);
}
