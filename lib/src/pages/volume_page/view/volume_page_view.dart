import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_icon.dart';
import '../../../components/button_with_text.dart';
import '../../../components/scaffold.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_volumePart(), _actionButtons()],
            ),
          ),
        ),
      );

  Row _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButtonWithText(
          label: 'بله',
          action: controller.navigateToFontPage,
        ),
        CustomButtonWithText.secondary(
          label: 'بیشتر شود',
          action: () {},
        ),
        CustomButtonWithText.outline(
          label: 'کمتر شود',
          action: () {},
        ),
      ],
    );
  }

  Widget _volumePart() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _volumeButton(),
          _hintText(),
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

  Widget _hintText() => const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            'تنظیم صدا: علامت صدا رو لمس کن.',
            style: Constants.disableTextStyle,
            textDirection: TextDirection.rtl,
          ),
          Constants.mediumHorizontalSpacer,
          AutoSizeText(
            'صدای زنگ رو میشنوی؟',
            style: Constants.defaultTextStyle,
            textDirection: TextDirection.rtl,
          ),
        ],
      );
}
