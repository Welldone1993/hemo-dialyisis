import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class Reports extends GetView<ProfilePageController> {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.secondaryCardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.95,
          child: FractionallySizedBox(
            heightFactor: 0.95,
            widthFactor: 0.95,
            child: Column(
              children: [
                Expanded(child: _treatmentRecordTitle()),
                Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(flex:5,child: _monthlyLineChart()),
                        const Spacer(),
                        Expanded(flex: 5,child: _monthlyBarChart()),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );

  Widget _monthlyBarChart() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _title('وفاداری به درمان')),
          const Spacer(),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: _barChartItem(
                    amount: 1,
                    monthName: 'بهمن',
                  ),
                ),
                Expanded(
                  child: _barChartItem(
                    amount: 0.8,
                    monthName: 'دی',
                  ),
                ),
                Expanded(
                  child: _barChartItem(
                    amount: 0.7,
                    monthName: 'آذر',
                  ),
                ),
                Expanded(
                  child: _barChartItem(
                    amount: 0.9,
                    monthName: 'آبان',
                  ),
                ),
                Expanded(
                  child: _barChartItem(
                    amount: 1,
                    monthName: 'مهر',
                  ),
                ),
                Expanded(
                  child: _barChartItem(
                    amount: 1,
                    monthName: 'شهریور',
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _monthlyLineChart() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _title('میزان نیاز به حذف مایع')),
          const Spacer(),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: _lineChartItem(
                    amount: 0.7,
                    monthName: 'بهمن',
                  ),
                ),
                Expanded(
                  child: _lineChartItem(
                    amount: 0.6,
                    monthName: 'دی',
                  ),
                ),
                Expanded(
                  child: _lineChartItem(
                    amount: 0.8,
                    monthName: 'آذر',
                  ),
                ),
                Expanded(
                  child: _lineChartItem(
                    amount: 0.7,
                    monthName: 'آبان',
                  ),
                ),
                Expanded(
                  child: _lineChartItem(
                    amount: 0.95,
                    monthName: 'مهر',
                  ),
                ),
                Expanded(
                  child: _lineChartItem(
                    amount: 1,
                    monthName: 'شهریور',
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _barChartItem({
    required String monthName,
    required double amount,
  }) =>
      Column(
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: LinearProgressIndicator(
                value: amount,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.mediumSpace),
                ),
                backgroundColor: Constants.whiteColor,
                color: Constants.buttonColor,
              ),
            ),
          ),
          _title(monthName),
        ],
      );

  Widget _lineChartItem({
    required String monthName,
    required double amount,
  }) =>
      Column(
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: LinearProgressIndicator(
                value: amount,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.mediumSpace),
                ),
                backgroundColor: Constants.cardBorderColor,
                color: Constants.lineChartColor,
              ),
            ),
          ),
          _title(monthName),
        ],
      );

  Widget _treatmentRecordTitle() => Padding(
        padding: Constants.mediumPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.edit,
              color: Constants.iconFirstColor,
            ),
            Constants.largeHorizontalSpacer,
            _title('گزارشات پیشرفت درمان کاربر'),
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
}
