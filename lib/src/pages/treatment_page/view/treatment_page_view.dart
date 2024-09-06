import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/treatment_controller.dart';

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

  Widget _beforeTreatment() => FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: Column(
          children: [
            Expanded(child: _treatmentTimer()),
            Constants.giantVerticalSpacer,
            Expanded(child: _treatmentInfo())
          ],
        ),
      );

  Widget _treatmentInfo() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: Placeholder(),
      );

  Widget _treatmentTimer() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Placeholder()),
              Expanded(
                flex: 4,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      _actualTime(),
                      Expanded(
                        child: Obx(
                          () => Row(
                            children: [
                              Expanded(
                                child: _timeCounter(
                                  title: 'ثانیه',
                                  count: controller.remainingSecond.value,
                                ),
                              ),
                              Expanded(
                                child: _timeCounter(
                                  title: 'دقیقه',
                                  count: controller.remainingMinute.value,
                                ),
                              ),
                              Expanded(
                                child: _timeCounter(
                                  title: 'ساعت',
                                  count: controller.remainingHour.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 4, child: _hintText()),
            ],
          ),
        ),
      );

  Widget _timeCounter({
    required final String count,
    required final String title,
  }) =>
      Padding(
        padding: const EdgeInsets.all(Constants.largeSpace),
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: AutoSizeText(
                    count,
                    style: const TextStyle(
                      fontFamily: Constants.iranSansFaNumFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            Constants.mediumVerticalSpacer,
            AutoSizeText(
              title,
              style: const TextStyle(
                fontFamily: Constants.iranSansFaNumFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _actualTime() => const AutoSizeText(
        'زمان باقیمانده از 4 ساعت و 30 دقیقه',
        style: TextStyle(
          fontFamily: Constants.iranSansFaNumFont,
          fontWeight: FontWeight.w500,
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

  Widget _hintText() => const FractionallySizedBox(
        heightFactor: 0.3,
        widthFactor: 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AutoSizeText(
                'در حال درمان',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  color: Constants.disableColor,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                'همودیالیز در حال انجام است....',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      );
}
