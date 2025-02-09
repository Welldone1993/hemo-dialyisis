import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../components/image_provider.dart';
import '../../../infrastructure/utils/constants.dart';

class StepperHeader extends StatelessWidget {
  const StepperHeader({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          dragStartBehavior: DragStartBehavior.down,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _stepperItem(
                title: 'قطع اتصالات',
                imageAddress: Constants.step11,
                isDone: index > 10,
                isSelected: index == 10,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'بازگشت خون',
                imageAddress: Constants.step10,
                isDone: index > 9,
                isSelected: index == 9,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'نظارت',
                imageAddress: Constants.step09,
                isDone: index > 8,
                isSelected: index == 8,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'درمان',
                imageAddress: Constants.step08,
                isDone: index > 7,
                isSelected: index == 7,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'آماده سازی',
                imageAddress: Constants.step07,
                isDone: index > 6,
                isSelected: index == 6,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'اتصالات',
                imageAddress: Constants.step06,
                isDone: index > 5,
                isSelected: index == 5,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'وزن',
                imageAddress: Constants.step05,
                isDone: index > 4,
                isSelected: index == 4,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'دسترسی',
                imageAddress: Constants.step04,
                isDone: index > 3,
                isSelected: index == 3,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'صدا',
                imageAddress: Constants.step03,
                isDone: index > 2,
                isSelected: index == 2,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'فونت',
                imageAddress: Constants.step02,
                isDone: index > 1,
                isSelected: index == 1,
              ),
              Constants.mediumHorizontalSpacer,
              _stepperItem(
                title: 'مکان',
                imageAddress: Constants.step01,
                isDone: index > 0,
                isSelected: index == 0,
              ),
            ],
          ),
        ),
      );

  Widget _stepperItem({
    required String title,
    required String imageAddress,
    required bool isDone,
    required bool isSelected,
  }) =>
      Column(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: isDone ? Constants.disableColor : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isSelected ? null : Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomImageProvider(
                  imageAddress: imageAddress,
                ),
              ),
            ),
          ),
          _title(title)
        ],
      );

  Widget _title(String text) => AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFaNumFont,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Constants.disableColor,
        ),
      );
}
