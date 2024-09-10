import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/treatment_controller.dart';

class TreatmentTimer extends GetView<TreatmentPageController> {
  const TreatmentTimer({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _progressIndicator()),
              Expanded(flex: 3, child: _timer()),
              Expanded(flex: 5, child: _hintText()),
            ],
          ),
        ),
      );

  Widget _timer() => FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            _actualTime(),
            Expanded(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
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
      );

  Widget _progressIndicator() => FractionallySizedBox(
        widthFactor: 0.15,
        child: RotatedBox(
          quarterTurns: 3,
          child: Obx(
            () => LinearProgressIndicator(
              value: controller.remainingTime.value,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.mediumSpace)),
              backgroundColor: Constants.buttonSecondaryColor,
              color: Constants.buttonColor,
            ),
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
              flex: 3,
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
            const Spacer(),
            SizedBox(
              child: AutoSizeText(
                title,
                style: const TextStyle(
                  fontFamily: Constants.iranSansFaNumFont,
                  fontWeight: FontWeight.w500,
                ),
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
