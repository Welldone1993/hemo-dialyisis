import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/font_page_controller.dart';

class FontPageView extends GetView<FontPageController> {
  const FontPageView({super.key});

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
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: _fontHintText()),
                Expanded(child: _actionButtons()),
              ],
            ),
          ),
        ),
      );

  Widget _actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButtonWithText(
              label: 'بله',
              action: controller.navigateToVascularAccessPage,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.secondary(
              label: 'بزرگتر شود',
              action: () {},
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.outline(
              label: 'کوچکتر شود',
              action: () {},
            ),
          ),
        ],
      );

  Widget _fontHintText() => const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            'تنظیم نوشته ها',
            style: Constants.disableTextStyle,
            textDirection: TextDirection.rtl,
          ),
          Constants.mediumHorizontalSpacer,
          AutoSizeText(
            'اندازه نوشته ها مناسب است؟',
            style: Constants.defaultTextStyle,
            textDirection: TextDirection.rtl,
          ),
        ],
      );
}
