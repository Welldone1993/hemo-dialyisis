import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/scaffold.dart';

import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/education_page_controller.dart';
import 'widget/device_info.dart';
import 'widget/education_part.dart';

class EducationPageView extends GetView<EducationPageController> {
  const EducationPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
        hasFloatingActionButton: true,
      );

  Widget _body() => Obx(
        () => DecoratedBox(
          decoration: Decorations.secondaryCardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.95,
            widthFactor: 0.95,
            child: controller.canShowData.value ? _data() : const SizedBox(),
          ),
        ),
      );

  Widget _data() => const Row(
        children: [
          Expanded(child: EducationPart()),
          Expanded(child: DeviceInfo()),
        ],
      );
}
