import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/scaffold.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/store_page_controller.dart';

class StorePageView extends GetView<StorePageController> {
  const StorePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Placeholder(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );
}
