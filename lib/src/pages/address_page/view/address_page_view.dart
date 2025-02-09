import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/button_with_text.dart';
import '../../../components/image_provider.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/app_controller/app_controller.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_home_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../../shared/view/stepper_header.dart';
import '../controller/address_controller.dart';

class AddressPageView extends GetView<AddressController> {
  const AddressPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
        action3: const AppBarHomeIcon(),
        stepper: const StepperHeader(index: 0),
      );

  Widget _body() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 0.9,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(child: _addressPart()),
                  Expanded(flex: 2, child: _addressData()),
                ],
              )),
              _actionButtons(),
            ],
          ),
        ),
      );

  Widget _addressData() => FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AutoSizeText(
                'مکان یابی: شناسایی موقعیت مکانی برای ارائه خدمات پشتیبانی',
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
                'اگر در حال حاضر به اینترنت دسترسی ندارید، آدرس را بصورت دستی وارد کنید.',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.bold,
                  fontSize: AppController().setting.value!.valueFontSize,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'آدرس',
                      style: TextStyle(
                        fontFamily: Constants.iranSansFont,
                        fontWeight: FontWeight.bold,
                        fontSize: AppController().setting.value!.valueFontSize,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Constants.mediumVerticalSpacer,
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Constants.whiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Constants.mediumSpace),
                              ),
                              border: Border.all(
                                color: Constants.cardBorderColor,
                              ),
                            ),
                            child: const SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: AutoSizeText(
                                  'آدرس های قبلی',
                                  style: TextStyle(
                                      fontFamily: Constants.iranSansFont,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Constants.disableColor),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Constants.mediumHorizontalSpacer,
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Constants.cardBorderColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Constants.smallSpace),
                            ),
                          ),
                          child: Padding(
                            padding: Constants.smallPadding,
                            child: Icon(
                              Icons.mic,
                              color: Constants.whiteColor,
                            ),
                          ),
                        ),
                        Constants.mediumHorizontalSpacer,
                        Expanded(
                          flex: 3,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Constants.whiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Constants.mediumSpace),
                              ),
                              border: Border.all(
                                color: Constants.cardBorderColor,
                              ),
                            ),
                            child: const SizedBox(
                              height: 50,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _addressPart() => const CustomImageProvider(
        imageAddress: Constants.addressImage,
      );

  Widget _actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButtonWithText(
              label: 'ادامه',
              action: controller.navigateToFontPage,
            ),
          ),
          const Spacer(),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.secondary(
              label: 'بازگشت به خانه',
              action: controller.navigateToHomePage,
            ),
          ),
        ],
      );
}
