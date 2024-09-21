import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_icon.dart';
import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/volume_page_controller.dart';

class VolumePageView extends GetView<VolumePageController> {
  const VolumePageView({super.key});

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
              Expanded(child: _volumePart()),
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
              label: 'بله',
              action: controller.navigateToFontPage,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.secondary(
              label: 'بیشتر شود',
              action: () {},
            ),
          ),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.outline(
              label: 'کمتر شود',
              action: () {},
            ),
          ),
        ],
      );

  Widget _volumePart() => Row(
        children: [
          _volumeButton(),
          Expanded(flex: 3, child: _hintText()),
        ],
      );

  Widget _volumeButton() => CustomButtonWithIcon(
        icon: CupertinoIcons.speaker_2,
        action: () {
          //   TODO: action in mute button
        },
        color: Constants.whiteColor,
        height: 100,
        width: 100,
        iconColor: Constants.buttonSecondaryColor,
      );

  Widget _hintText() => FractionallySizedBox(
        heightFactor: 0.8,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AutoSizeText(
                  'تنظیم صدا: علامت صدا رو لمس کن.',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    color: Constants.disableColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppController().setting.value!.titleFontSize,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Constants.mediumVerticalSpacer,
              Expanded(
                child: AutoSizeText(
                  'صدای زنگ رو میشنوی؟',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    fontSize: AppController().setting.value!.valueFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      );
}
