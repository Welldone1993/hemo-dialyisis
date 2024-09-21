import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/weighing_page_controller.dart';

class WeighingPageView extends GetView<WeighingPageController> {
  const WeighingPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _weighingPart()),
                    Expanded(child: _hintText()),
                  ],
                ),
              ),
              Expanded(child: _actionButtons()),
            ],
          ),
        ),
      );

  Widget _weighingPart() => FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.6,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                'کیلوگرم',
                style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              AutoSizeText(
                '64.6',
                style: TextStyle(
                    fontFamily: Constants.iranSansFaNumFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 35),
              ),
            ],
          ),
        ),
      );

  Widget _actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButtonWithText(
              label: 'مرحله بعد',
              action: controller.navigateToInstallingPage,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.secondary(
              label: 'وزن کشی مجدد',
              action: () {},
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      );

  Widget _hintText() => FractionallySizedBox(
        heightFactor: 0.6,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: AutoSizeText(
                  'وزن کشی',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    color: Constants.disableColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppController().setting.value!.titleFontSize,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  'لطفا روی ترازوی دستگاه بایستید.',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    fontSize: AppController().setting.value!.valueFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
}
