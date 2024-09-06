import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/treatment_controller.dart';
import 'widget/treatment_timer.dart';

class TreatmentPageView extends GetView<TreatmentPageController> {
  const TreatmentPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Obx(_body),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() =>
      controller.isTreatmentDone.value ? _afterTreatment() : _beforeTreatment();

  Widget _treatmentInfo() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: Placeholder(),
      );

  Widget _beforeTreatment() => FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: Column(
          children: [
            const Expanded(child: TreatmentTimer()),
            Constants.giantVerticalSpacer,
            Expanded(child: _treatmentInfo())
          ],
        ),
      );

  Widget _afterTreatment() => FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: DecoratedBox(
          decoration: Decorations.cardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _actionButtons()),
              ],
            ),
          ),
        ),
      );

  Widget _actionButtons() => Row(
        children: [
          CustomButtonWithText(
            label: 'مرحله بعد',
            action: controller.navigateToBloodReturnPage,
          ),
        ],
      );
}
