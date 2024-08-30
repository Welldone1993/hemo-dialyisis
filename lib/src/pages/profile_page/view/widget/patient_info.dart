import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class PatientInfo extends GetView<ProfilePageController> {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.95,
        child: DecoratedBox(
          decoration: Decorations.creamyCardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.95,
            widthFactor: 0.9,
            child: Row(
              children: [
                Expanded(child: _patientData()),
                Expanded(child: _patientTitle()),
              ],
            ),
          ),
        ),
      );

  Widget _patientData() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _dataText('58.300 کیلوگرم', hasNumber: true)),
          Expanded(child: _dataText('300 میلی لیتر در ثانیه', hasNumber: true)),
          Expanded(
              child: _dataText('62 متر مربعی های فلاکس 200', hasNumber: true)),
          Expanded(child: _dataText('2.5 لیتر', hasNumber: true)),
          Expanded(
              child: _dataText(
                  'بولوس اولیه 1000 واحد، سپس انفوزیون 500 واحد هر 15 دقیقه',
                  hasNumber: true)),
          Expanded(child: _dataText('بیکربنات سدیم', hasNumber: true)),
          Expanded(child: _dataText('آهن، پتاسیم', hasNumber: true)),
        ],
      );

  Widget _patientTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _titleText('وزن نرمال بیمار')),
          Expanded(child: _titleText('سرعت گردش خون')),
          Expanded(child: _titleText('نوع صافی')),
          Expanded(child: _titleText('حجم مایع دیالیز')),
          Expanded(child: _titleText('بولوس هپارین')),
          Expanded(child: _titleText('بافر')),
          Expanded(child: _titleText('داروهای تزریقی')),
        ],
      );

  Widget _titleText(
    final String text,
  ) =>
      AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.bold,
          color: Constants.buttonShadowColor,
        ),
        textDirection: TextDirection.rtl,
      );

  Widget _dataText(
    final String text, {
    final bool? hasNumber,
  }) =>
      AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: hasNumber ?? false
              ? Constants.iranSansFaNumFont
              : Constants.iranSansFont,
          fontWeight: FontWeight.w500,
          color: Constants.buttonShadowColor,
        ),
        textDirection: TextDirection.rtl,
      );
}
