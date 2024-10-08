import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/vascular_access_controller.dart';

class VascularAccessPageView extends GetView<VascularAccessController> {
  const VascularAccessPageView({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _hintText()),
              Expanded(child: _actionButtons()),
            ],
          ),
        ),
      );

  Widget _actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButtonWithText(
              label: 'فیستول / گرافت',
              action: controller.navigateToConsumablesPage,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.secondary(
              label: 'کتتر دائم',
              action: controller.navigateToConsumablesPage,
            ),
          ),
          const Spacer(),
        ],
      );

  Widget _hintText() => FractionallySizedBox(
        heightFactor: 0.8,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AutoSizeText(
                  'دسترسی عروقی',
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
                  'نوع دسترسی خود را انتخاب کنید.',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    fontSize: AppController().setting.value!.valueFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      );
}
