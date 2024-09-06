import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/physical_preparation_page/controller/physical_preparation_controller.dart';

import '../../../components/button_with_text.dart';
import '../../../components/checkbox.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';

class PhysicalPreparationPageView extends GetView<PhysicalPreparationPageController> {
  const PhysicalPreparationPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => FractionallySizedBox(
        heightFactor: 0.85,
        widthFactor: 0.85,
        child: DecoratedBox(
          decoration: Decorations.cardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.85,
            widthFactor: 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: _hintText()),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(child: _actionButtons()),
                      Expanded(flex: 3, child: _checkList()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _checkList() => Column(
        children: controller.installingItemList
            .map(
              (item) => Expanded(
                child: CustomCheckbox(
                  label: item.title,
                  action: () {},
                ),
              ),
            )
            .toList(),
      );

  Widget _actionButtons() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonWithText(
            label: 'مرحله بعد',
            action: controller.navigateToPreparationPage,
          ),
        ],
      );

  Widget _hintText() => const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: AutoSizeText(
              'نصب مواد مصرفی',
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
              'لطفا موارد زیر را انجام داده و با انجام هر مرحله تیک کنار آن را فعال کنید.',
              style: TextStyle(
                fontFamily: Constants.iranSansFont,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Spacer(),
        ],
      );
}
