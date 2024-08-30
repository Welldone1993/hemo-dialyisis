import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/education_page/controller/education_page_controller.dart';

import '../../../../infrastructure/utils/constants.dart';

class EducationPart extends GetView<EducationPageController> {
  const EducationPart({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          const Spacer(),
          Expanded(child: _title()),
          const Spacer(),
          Expanded(
            child: _videoItems('مراحل آماده سازی'),
          ),
          Expanded(
            child: _videoItems('نحوه ورود نسخه توسط پزشک'),
          ),
          Expanded(
            child: _videoItems(
                'نحوه استفاده از اپلیکیشن موبایلی برای دریافت نسخه از پزشک'),
          ),
          Expanded(
            child: _videoItems('مراحل نصب'),
          ),
          Expanded(
            child: _videoItems('مراحل حین درمان'),
          ),
          Expanded(
            child: _videoItems('آموزش خطا گیری'),
          ),
          Expanded(
            child: _videoItems('مراحل بازگشت خون'),
          ),
          Expanded(
            child: _videoItems('مراحل جداسازی دستگاه از بیمار'),
          ),
          const Spacer(),
          const Spacer(),
        ],
      );

  Widget _title() => const AutoSizeText(
        'فهرست ویدئوهای آموزشی',
        style: TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Constants.pinkColor,
        ),
      );

  Widget _videoItems(final String text) => GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(
                ' ویدئو $text آپلود نشده ',
                style: const TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
              duration: const Duration(milliseconds: 800),
              backgroundColor: Constants.buttonSecondaryColor,
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AutoSizeText(
                text,
                style: const TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.w300,
                  color: Constants.pinkColor,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            Constants.mediumHorizontalSpacer,
            const Icon(
              Icons.circle,
              color: Constants.pinkColor,
              size: 5,
            ),
          ],
        ),
      );
}
