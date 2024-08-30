import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../controller/profile_page_controller.dart';

class PrescriptionInfo extends GetView<ProfilePageController> {
  const PrescriptionInfo({super.key});

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: _title()),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(child: _prescriptionData()),
                  Expanded(flex: 2, child: _prescriptionTitle()),
                ],
              ),
            )
          ],
        ),
      );

  Widget _prescriptionTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _titleText('تاریخ نسخه:')),
          Expanded(child: _titleText('تاریخ اعتبار تا:')),
          Expanded(child: _titleText('پزشک صادر کننده:')),
          Expanded(
              child: _titleText('تکرار درمان توصیه شده برای همودیالیز خانگی:')),
          Expanded(child: _titleText('زمان تقریبی هر جلسه:')),
        ],
      );

  Widget _prescriptionData() => Column(
        children: [
          Expanded(child: _dataText('1403/04/26', hasNumber: true)),
          Expanded(child: _dataText('1403/07/26', hasNumber: true)),
          Expanded(child: _dataText('دکتر جلال مرادی')),
          Expanded(child: _dataText('هفته ای 6 تا 7 روز', hasNumber: true)),
          Expanded(child: _dataText('1 ساعت و 20 دقیقه', hasNumber: true)),
        ],
      );

  Widget _title() => const AutoSizeText(
        'نسخه همو دیالیز',
        style: TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Constants.pinkColor,
        ),
      );

  Widget _titleText(
    final String text,
  ) =>
      AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w300,
          color: Constants.pinkColor,
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
          fontWeight: FontWeight.w100,
          color: Constants.pinkColor,
        ),
        textDirection: TextDirection.rtl,
      );
}
