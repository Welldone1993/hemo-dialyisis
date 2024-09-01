import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
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
        body: Placeholder(),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );


  Widget _actionButtons() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonWithText(
            label: 'مرحله بعد',
            action: () {},
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
