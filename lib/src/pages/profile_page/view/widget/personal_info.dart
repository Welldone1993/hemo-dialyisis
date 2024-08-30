import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/profile_page/controller/profile_page_controller.dart';

import '../../../../components/image_provider.dart';
import '../../../../infrastructure/utils/constants.dart';

class PersonalInfo extends GetView<ProfilePageController> {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: _profilePicture()),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _profileInfoTitle()),
                  Expanded(child: _profileInfoData()),
                ],
              ),
            )
          ],
        ),
      );

  Widget _profileInfoData() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _infoTitleText('نام:')),
          Expanded(child: _infoTitleText('نام خانوادگی:')),
          Expanded(child: _infoTitleText('سن:')),
          Expanded(child: _infoTitleText('شماره تماس:')),
          Expanded(child: _infoTitleText('آدرس:')),
        ],
      );

  Widget _profileInfoTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _infoDataText('محمد')),
          Expanded(child: _infoDataText('آقایی')),
          Expanded(
            child: _infoDataText('72 سال', hasNumber: true),
          ),
          Expanded(
            child: _infoDataText('09120924245', hasNumber: true),
          ),
          Expanded(
            child: _infoDataText(' تهران، امیرآبادشمالی 18، پلاک 20',
                hasNumber: true),
          ),
        ],
      );

  Widget _infoTitleText(
    final String text,
  ) =>
      AutoSizeText(
        text,
        style: const TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w500,
          color: Constants.whiteColor,
        ),
        textDirection: TextDirection.rtl,
      );

  Widget _infoDataText(
    final String text, {
    final bool? hasNumber,
  }) =>
      AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: hasNumber ?? false
              ? Constants.iranSansFaNumFont
              : Constants.iranSansFont,
          fontWeight: FontWeight.w300,
          color: Constants.whiteColor,
        ),
        textDirection: TextDirection.rtl,
      );

  Widget _profilePicture() => const FractionallySizedBox(
        heightFactor: 0.7,
        widthFactor: 0.5,
        child: Column(
          children: [
            Expanded(
              child: CustomImageProvider(
                imageAddress: Constants.avatarImage,
              ),
            ),
            AutoSizeText(
              'پروفایل کاربری',
              style: TextStyle(
                fontFamily: Constants.iranSansFont,
                color: Constants.whiteColor,
              ),
            ),
          ],
        ),
      );
}
