import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/education_page/controller/education_page_controller.dart';

import '../../../../components/image_provider.dart';
import '../../../../infrastructure/utils/constants.dart';

class DeviceInfo extends GetView<EducationPageController> {
  const DeviceInfo({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Expanded(
            child: CustomImageProvider(
              imageAddress: Constants.deviceImage,
            ),
          ),
          const AutoSizeText(
            'دستگاه همودیالیز خانگی لیزا مدل AK88',
            style: TextStyle(
              fontFamily: Constants.iranSansFont,
              fontWeight: FontWeight.w500,
            ),
            textDirection: TextDirection.rtl,
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.9,
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'محصول کشور ایران',
                      style: _boldWhitTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'محصول کشور ایران شرکت تکنولوژی های نو سلامت پارسیان',
                      style: _boldWhitTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'وزن: 24 کیلوگرم',
                      style: _lightWhiteTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'ابعاد: 50 در 50 در 30 سانتی متر',
                      style: _lightWhiteTextStyle(),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  TextStyle _lightWhiteTextStyle() => const TextStyle(
        fontFamily: Constants.iranSansFaNumFont,
        fontWeight: FontWeight.w100,
        color: Constants.whiteColor,
      );

  TextStyle _boldWhitTextStyle() => const TextStyle(
        fontFamily: Constants.iranSansFont,
        fontWeight: FontWeight.bold,
        color: Constants.whiteColor,
      );
}
