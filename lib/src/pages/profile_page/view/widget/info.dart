import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/infrastructure/utils/constants.dart';

import '../../../../components/image_provider.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class Info extends GetView<ProfilePageController> {
  const Info({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.secondaryCardDecoration(),
        child: _body(),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Constants.largeSpace, horizontal: Constants.giantSpace),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(child: _profilePicture()),
                  Expanded(child: _personalInfo()),
                ],
              ),
            ),
            Expanded(child: _address())
          ],
        ),
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
            Row(
              children: [
                Spacer(),
                Icon(
                  Icons.download,
                  color: Constants.filterButtonBorderColor,
                ),
                Constants.mediumHorizontalSpacer,
                Icon(
                  Icons.edit,
                  color: Constants.filterButtonBorderColor,
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            )
          ],
        ),
      );

  Widget _personalInfo() => FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: _profileInfoTitle()),
            const Spacer(),
            Expanded(child: _profileInfoData()),
          ],
        ),
      );

  Widget _address() => FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Expanded(child: _addressData()),
            Expanded(child: _addressTitle()),
          ],
        ),
      );

  Column _addressData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: _dataText('09120924245', hasNumber: true),
        ),
        Expanded(
          child: _dataText(
            ' تهران، امیرآبادشمالی 18، پلاک 20',
            hasNumber: true,
          ),
        ),
      ],
    );
  }

  Column _addressTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: _titleText('شماره تماس:')),
        Expanded(child: _titleText('آدرس:')),
      ],
    );
  }

  Widget _profileInfoData() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _dataText('مشخصات کاربری')),
          Expanded(child: _titleText('نام:')),
          Expanded(child: _titleText('نام خانوادگی:')),
          Expanded(child: _titleText('سن:')),
          Expanded(
            child: _titleText('گروه خونی:', textColor: Constants.starColor),
          ),
        ],
      );

  Widget _profileInfoTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _editIcon()),
          Expanded(child: _dataText('محمد')),
          Expanded(child: _dataText('آقایی')),
          Expanded(child: _dataText('72 سال', hasNumber: true)),
          Expanded(
            child: _dataText(
              '+O',
              textColor: Constants.starColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _editIcon() => const Icon(
        Icons.edit_note,
        color: Constants.buttonThirdColor,
        size: Constants.giantSpace,
      );

  Widget _titleText(
    final String text, {
    final Color? textColor,
  }) =>
      AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: Constants.iranSansFont,
          fontWeight: FontWeight.w500,
          color: textColor ?? Constants.whiteColor,
        ),
        textDirection: TextDirection.rtl,
      );

  Widget _dataText(
    final String text, {
    final bool? hasNumber,
    final Color? textColor,
    final FontWeight? fontWeight,
  }) =>
      AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: hasNumber ?? false
              ? Constants.iranSansFaNumFont
              : Constants.iranSansFont,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: textColor ?? Constants.whiteColor,
        ),
        textDirection: TextDirection.rtl,
      );
}
