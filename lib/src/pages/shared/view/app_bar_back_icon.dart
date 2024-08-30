import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/text_button.dart';
import '../../../infrastructure/utils/constants.dart';

class AppBarBackIcon extends StatelessWidget {
  const AppBarBackIcon({super.key});

  @override
  Widget build(BuildContext context) => CustomTextButton(
        action: Get.back,
        text: 'بازگشت',
        style: const TextStyle(
          fontFamily: Constants.iranSansFont,
          color: Constants.buttonSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
      );
}
