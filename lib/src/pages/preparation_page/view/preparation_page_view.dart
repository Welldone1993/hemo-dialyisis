import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/image_provider.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/preparation_page_controller.dart';

class PreparationPageView extends GetView<PreparationPageController> {
  const PreparationPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: DecoratedBox(
          decoration: Decorations.cardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 0.9,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _primeImageAndHints(),
                  ),
                  if (!controller.isPreparationMode.value)
                    Expanded(child: _actionButtons()),
                  if (controller.isPreparationMode.value)
                    Expanded(child: _timer())
                ],
              ),
            ),
          ),
        ),
      );

  Widget _primeImageAndHints() => Row(
        children: [
          Expanded(child: _primeImage()),
          Expanded(flex: 3, child: _hintText())
        ],
      );

  Widget _primeImage() => const CustomImageProvider(
        imageAddress: Constants.primeImage,
      );

  Widget _actionButtons() => Obx(
        () => Row(
          children: [
            CustomButtonWithText(
              label: controller.buttonName.value,
              action: controller.actionOnButton,
            ),
          ],
        ),
      );

  Widget _hintText() => FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _preparationHint()),
            Expanded(child: Obx(() => _checkProcessHint())),
            if (!controller.isPreparationMode.value &&
                !controller.isReady.value)
              Expanded(child: _primeHint()),
            const Spacer(),
            const Spacer(),
          ],
        ),
      );

  Widget _checkProcessHint() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.isReady.value)
            const FittedBox(
              child: Icon(
                CupertinoIcons.checkmark_alt_circle,
                color: Constants.successColor,
                size: 50,
              ),
            ),
          AutoSizeText(
            _getHint(),
            style: const TextStyle(
              fontFamily: Constants.iranSansFont,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),

        ],
      );

  Widget _preparationHint() => const AutoSizeText(
        'آماده سازی',
        style: TextStyle(
          fontFamily: Constants.iranSansFont,
          color: Constants.disableColor,
          fontWeight: FontWeight.w500,
        ),
        textDirection: TextDirection.rtl,
      );

  String _getHint() {
    if (!controller.isPreparationMode.value && !controller.isReady.value) {
      return 'دستگاه برای آماده سازی حاضر است.';
    } else if (controller.isPreparationMode.value) {
      return 'دستگاه در حال آماده سازی است. لطفا صبر کنید...';
    } else if (controller.isReady.value) {
      return 'دستگاه برای درمان آماده است.';
    } else {
      return '';
    }
  }

  Widget _primeHint() => const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: AutoSizeText(
              'در صورتی که مراحل قبل را به اتمام رسانده اید، دکمه آماده سازی را لمس کنید.',
              style: TextStyle(
                fontFamily: Constants.iranSansFont,
                color: Constants.disableColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Constants.mediumHorizontalSpacer,
          Icon(
            CupertinoIcons.info,
            color: Constants.disableColor,
          ),
        ],
      );

  Widget _timer() => FractionallySizedBox(
        widthFactor: 0.3,
        heightFactor: 0.6,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              children: [
                const Expanded(
                  child: AutoSizeText(
                    'زمان انتظار',
                    style: TextStyle(
                      fontFamily: Constants.iranSansFont,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => AutoSizeText(
                      controller.remainingTime.value,
                      style: const TextStyle(
                          fontFamily: Constants.iranSansFaNumFont,
                          fontWeight: FontWeight.w500,
                          fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
