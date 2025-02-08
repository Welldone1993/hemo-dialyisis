import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalali_table_calendar/jalali_table_calendar.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class TreatmentCalendar extends GetView<ProfilePageController> {
  const TreatmentCalendar({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.secondaryCardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 0.95,
          child: _body(context),
        ),
      );

  Widget _firstMonth(BuildContext context) => JalaliTableCalendar(
        context: context,
        marker: (date, events) => const ColoredBox(
          color: Colors.red,
          child: SizedBox(
            height: 2,
            width: 15,
          ),
        ),
        events: {
          controller.today.add(const Duration(days: -3)): const [],
          controller.today.add(const Duration(days: 1)): const [],
          controller.today.add(const Duration(days: 5)): const [],
        },
      );

  Widget _body(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _guidePart()),
                  Expanded(child: _treatmentCalendarTitle()),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(child: _secondMonth(context)),
                  Expanded(child: _firstMonth(context)),
                ],
              ),
            ),
            Expanded(child: _addDatePart()),
          ],
        ),
      );

  Widget _addDatePart() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _title('افزودن تاریخ جدید'),
          Constants.largeHorizontalSpacer,
          const DecoratedBox(
            decoration: BoxDecoration(
                color: Constants.deSelectedChipTextColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: Constants.smallPadding,
              child: Icon(
                Icons.add,
                color: Constants.whiteColor,
              ),
            ),
          ),
        ],
      );

  Widget _secondMonth(BuildContext context) => JalaliTableCalendar(
        context: context,
        marker: (date, events) => const ColoredBox(
          color: Colors.red,
          child: SizedBox(
            height: 2,
            width: 15,
          ),
        ),
        events: {
          controller.today.add(const Duration(days: -6)): const [],
          controller.today.add(const Duration(days: 2)): const [],
          controller.today.add(const Duration(days: 7)): const [],
        },
      );

  Widget _guidePart() => Stack(
        alignment: const Alignment(0.8, -1.3),
        children: [_guideBody(), _guideTitle()],
      );

  Widget _guideBody() => FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Constants.whiteColor,
              width: 0.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.largeSpace),
            ),
          ),
          child: Padding(
            padding: Constants.mediumPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Constants.buttonFourthColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Constants.largeSpace),
                      ),
                    ),
                    child: Center(child: _buttonTitle('آزمایش ماهیانه')),
                  ),
                ),
                Constants.mediumHorizontalSpacer,
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Constants.iconThirdColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Constants.largeSpace),
                      ),
                    ),
                    child: Center(child: _buttonTitle('چکاپ ماهیانه')),
                  ),
                ),
                Constants.mediumHorizontalSpacer,
                const AutoSizeText(
                  'امروز',
                  style: TextStyle(
                    fontFamily: Constants.iranSansFont,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Constants.iconThirdColor,
                  ),
                ),
                Constants.mediumHorizontalSpacer,
                const AutoSizeText(
                  'همودیالیز',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Constants.whiteColor,
                    fontFamily: Constants.iranSansFont,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Constants.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _guideTitle() => const ColoredBox(
        color: Constants.cardBorderColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.mediumSpace),
          child: AutoSizeText(
            'راهنما',
            style: TextStyle(
              fontFamily: Constants.iranSansFont,
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: Constants.whiteColor,
            ),
          ),
        ),
      );

  Widget _treatmentCalendarTitle() => Padding(
        padding: Constants.mediumPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.edit,
              color: Constants.iconFirstColor,
            ),
            Constants.largeHorizontalSpacer,
            _title('تقویم درمانی کاربر'),
          ],
        ),
      );

  Widget _title(String text) => AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFaNumFont,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Constants.whiteColor,
        ),
      );

  Widget _buttonTitle(String text) => AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: Constants.whiteColor,
        ),
      );
}
