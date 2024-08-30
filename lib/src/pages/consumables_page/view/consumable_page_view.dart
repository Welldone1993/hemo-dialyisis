import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/scaffold.dart';
import 'package:hemo_dialysis/src/pages/consumables_page/controller/consumable_page_controller.dart';

import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';

class ConsumablesPageView extends GetView<ConsumablesPageController> {
  const ConsumablesPageView({super.key});

  @override
  Widget build(BuildContext context) => const CustomScaffold(
        body: Placeholder(),
        action1: AppBarBackIcon(),
        action2: AppBarSupportIcon(),
      );
}
