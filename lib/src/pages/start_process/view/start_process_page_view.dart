import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/checkbox.dart';
import '../../../components/image_provider.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/start_process_controller.dart';

class StartProcessPageView extends GetView<StartProcessPageController> {
  const StartProcessPageView({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(child: _treatmentImage()),
                      Expanded(flex: 3, child: _hintTextAndCheckItems()),
                    ],
                  ),
                ),
                Expanded(child: _actionButtons()),
              ],
            ),
          ),
        ),
      );

  Widget _treatmentImage() => const CustomImageProvider(
        imageAddress: Constants.treatmentImage,
      );

  Widget _hintTextAndCheckItems() => FractionallySizedBox(
        heightFactor: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 3,
              child: AutoSizeText(
                'شروع درمان',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  color: Constants.disableColor,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const Expanded(
              flex: 3,
              child: AutoSizeText(
                'دستگاه برای شروع درمان حاضر است.',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            Expanded(flex: 3, child: _startTreatmentHint()),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Expanded(
              flex: 2,
              child: CustomCheckbox(
                label: 'ست های شریانی را بار دیگر چک کنید.',
                action: () {},
              ),
            ),
            const Spacer(),
            const Spacer(),
            Expanded(
              flex: 2,
              child: CustomCheckbox(
                label: 'اتصالات صافی و ست شریانی و ست مایعات را چک کنید.',
                action: () {},
              ),
            ),
          ],
        ),
      );

  Widget _startTreatmentHint() => const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: AutoSizeText(
              'پس از چک کردن موارد زیر دکمه شروع درمان را لمس کنید.',
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

  Widget _actionButtons() => Row(
        children: [
          CustomButtonWithText(
            label: 'شروع درمان',
            action: controller.navigateToTreatmentPage,
          ),
        ],
      );
}
