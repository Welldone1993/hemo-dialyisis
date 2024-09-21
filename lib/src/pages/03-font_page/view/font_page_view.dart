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
import '../controller/font_page_controller.dart';

class FontPageView extends GetView<FontPageController> {
  const FontPageView({super.key});

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
          child: Obx(
            ()=> Column(
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
              action: controller.increaseFont,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.outline(
              label: 'کوچکتر شود',
              action: controller.decreaseFont,

            ),
          ),
        ],
      );

  Widget _fontHintText() => FractionallySizedBox(
        heightFactor: 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AutoSizeText(
                'تنظیم نوشته ها',
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
                'اندازه نوشته ها مناسب است؟',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.bold,
                  fontSize: AppController().setting.value!.valueFontSize,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      );
}
