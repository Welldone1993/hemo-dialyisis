import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../controller/profile_page_controller.dart';

class Prescription extends GetView<ProfilePageController> {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.95,
        child: Row(
          children: [
            Expanded(child: _prescriptionDetail()),
            Constants.largeHorizontalSpacer,
            Expanded(child: _prescriptionInfo()),
          ],
        ),
      );

  Widget _prescriptionDetail() => DecoratedBox(
        decoration: BoxDecoration(
          color: Constants.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.xxLargeSpace),
          ),
          border: Border.all(
            color: Constants.cardBorderColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: _actionIcons()),
            Expanded(
              flex: 8,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _prescriptionDetailData()),
                    Expanded(child: _prescriptionDetailTitle()),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _prescriptionDetailTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _titleText('وزن نرمال بیمار')),
          Expanded(child: _titleText('سرعت گردش خون')),
          Expanded(child: _titleText('نوع صافی')),
          Expanded(child: _titleText('حجم مایع دیالیز')),
          Expanded(child: _titleText('بولوس هپارین')),
          Expanded(child: _titleText(' ')),
          Expanded(child: _titleText('بافر')),
          Expanded(child: _titleText('داروهای تزریقی')),
        ],
      );

  Widget _prescriptionDetailData() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: _dataText(
              '58.300 کیلوگرم',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText(
              '300 میلی لیتر در ثانیه',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText(
              '62 متر مربعی های فلاکس 200',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText(
              '2.5 لیتر',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText(
              'بولوس اولیه 1000 واحد',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText(
              'سپس انفوزیون 500 واحد هر 15 دقیقه.',
              hasNumber: true,
            ),
          ),
          Expanded(
            child: _dataText('بیکربنات سدیم'),
          ),
          Expanded(
            child: _dataText('آهن، پتاسیم'),
          ),
        ],
      );

  Widget _actionIcons() => const Padding(
        padding: Constants.mediumPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.edit,
              color: Constants.iconSecondColor,
            ),
            Constants.smallHorizontalSpacer,
            Icon(
              Icons.download,
              color: Constants.iconThirdColor,
            ),
            Constants.smallHorizontalSpacer,
            Icon(
              Icons.refresh,
              color: Constants.iconSecondColor,
            ),
          ],
        ),
      );

  Widget _prescriptionInfo() => FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: _title()),
            const Spacer(),
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
          color: Constants.disableColor,
        ),
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
          fontWeight: FontWeight.bold,
          color: Constants.buttonShadowColor,
        ),
        textDirection: TextDirection.rtl,
      );
}
