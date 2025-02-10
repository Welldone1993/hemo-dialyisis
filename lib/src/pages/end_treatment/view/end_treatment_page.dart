import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/image_provider.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../../shared/view/stepper_header.dart';
import '../controller/end_treatment_controller.dart';

class EndTreatmentPageView extends GetView<EndTreatmentController> {
  const EndTreatmentPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
        stepper: const StepperHeader(index: 10),
      );

  Widget _body() => DecoratedBox(
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
      );

  Widget _actionButtonAndTimer() => FractionallySizedBox(
        heightFactor: 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomButtonWithText(
              label: 'پایان درمان',
              action: controller.buttonAction,
            ),
            const Spacer(),
            Expanded(child: _bloodReturnTimer()),
          ],
        ),
      );

  Widget _hintAndCheckBox() => Column(
        children: [
          Expanded(
            flex: 3,
            child: FractionallySizedBox(
              heightFactor: 0.8,
              widthFactor: 1,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        'بازگشت خون',
                        style: TextStyle(
                          fontFamily: Constants.iranSansFont,
                          color: Constants.disableColor,
                          fontWeight: FontWeight.w500,
                          fontSize:
                              AppController().setting.value!.titleFontSize,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        'پس از بازگشت خون، درمان شما به اتمام میرسد.',
                        style: TextStyle(
                          fontFamily: Constants.iranSansFont,
                          fontSize:
                              AppController().setting.value!.valueFontSize,
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
            ),
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
