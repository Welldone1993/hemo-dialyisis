import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class MedicalRecords extends GetView<ProfilePageController> {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.secondaryCardDecoration(),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.95,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _addDocPart()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(flex: 2, child: _title('اسناد درمانی کاربر')),
                      Constants.giantVerticalSpacer,
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            _docsTitle('اسناد مربوط به آزمایشگاه'),
                            Constants.mediumVerticalSpacer,
                            _docsTitle('آرشیو نسخه ها'),
                            Constants.mediumVerticalSpacer,
                            _docsTitle('اسناد مربوط به تصویر برداری ها'),
                            Constants.mediumVerticalSpacer,
                            _docsTitle('اسناد مربوط به رژیم غذایی'),
                            Constants.mediumVerticalSpacer,
                            _docsTitle('اسناد دیگر'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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

  Widget _docsTitle(String text) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.edit,
              color: Constants.iconFirstColor,
            ),
            Constants.smallHorizontalSpacer,
            const Icon(
              Icons.download,
              color: Constants.iconThirdColor,
            ),
            const Spacer(),
            AutoSizeText(
              text,
              style: const TextStyle(
                fontFamily: Constants.iranSansFaNumFont,
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Constants.whiteColor,
                decoration: TextDecoration.underline,
                decorationColor: Constants.whiteColor,
              ),
            ),
            Constants.largeHorizontalSpacer,
            const ColoredBox(
              color: Constants.buttonSecondaryColor,
              child: SizedBox(
                height: 20,
                width: 5,
              ),
            ),
          ],
        ),
      );

  Widget _addDocPart() => Row(
        children: [
          _title('افزودن سند جدید'),
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
}
