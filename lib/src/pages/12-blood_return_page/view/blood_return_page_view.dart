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
import '../controller/blood_return_controller.dart';

class BloodReturnPageView extends GetView<BloodReturnController> {
  const BloodReturnPageView({super.key});

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
                  flex: 2,
                  child: Row(
                    children: [
                      const Expanded(
                        child: CustomImageProvider(
                          imageAddress: Constants.disconnectImage,
                        ),
                      ),
                      Expanded(flex: 2, child: _hintAndCheckBox()),
                    ],
                  ),
                ),
                Expanded(flex: 3, child: _actionButtonAndTimer()),
              ],
            ),
          ),
        ),
      );

  Widget _actionButtonAndTimer() => Obx(
        () => FractionallySizedBox(
          heightFactor: 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomButtonWithText(
                label: controller.actionButtonName.value,
                action: controller.buttonAction,
              ),
              const Spacer(),
              if (controller.isReturningBlood.value)
                Expanded(child: _bloodReturnTimer()),
            ],
          ),
        ),
      );

  Widget _hintAndCheckBox() => Obx(
        () => Column(
          children: [
            Expanded(
              flex: 3,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                widthFactor: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                      child: AutoSizeText(
                        'بازگشت خون',
                        style: TextStyle(
                          fontFamily: Constants.iranSansFont,
                          color: Constants.disableColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const Expanded(
                      child: AutoSizeText(
                        'پس از بازگشت خون، درمان شما به اتمام میرسد.',
                        style: TextStyle(
                          fontFamily: Constants.iranSansFont,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    if (!controller.isReturningBlood.value)
                      Expanded(child: _bloodReturnHint()),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            if (!controller.isReturningBlood.value)
              Expanded(
                  flex: 2,
                  child: FractionallySizedBox(
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomCheckbox(
                            label:
                                'ورودی خون به دستگاه را بسته و از محل دسترسی جدا کنید.',
                            action: () {},
                          ),
                        ),
                        Expanded(
                          child: CustomCheckbox(
                            label:
                                'دسترسی جدا شده را به محلول نرمال سالین متصل کنید.',
                            action: () {},
                          ),
                        ),
                      ],
                    ),
                  )),
          ],
        ),
      );

  Widget _bloodReturnHint() => const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: AutoSizeText(
              'پس از چک کردن موارد زیر دکمه بازگشت خون را لمس کنید.',
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

  Widget _bloodReturnTimer() => FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.5,
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
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
